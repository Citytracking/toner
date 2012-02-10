from math import pi, sin, cos
from random import choice
from copy import deepcopy

try:
    from PIL.ImageFont import truetype
except ImportError:
    from ImageFont import truetype

from shapely.geometry import Point, Polygon

NE, ENE, ESE, SE, SSE, S, SSW, SW, WSW, WNW, NW, NNW, N, NNE = range(14)

#
#          NNW   N   NNE
#        NW             NE
#       WNW      .      ENE
#       WSW             ESE
#        SW             SE
#          SSW   S   SSE
#
# slide 13 of http://www.cs.uu.nl/docs/vakken/gd/steven2.pdf
#
placements = {NE: 0.000, ENE: 0.070, ESE: 0.100, SE: 0.175, SSE: 0.200,
              S: 0.900, SSW: 1.000, SW: 0.600, WSW: 0.500, WNW: 0.470,
              NW: 0.400, NNW: 0.575, N: 0.800, NNE: 0.150}

class Place:

    def __init__(self, name, fontfile, fontsize, location, position, radius, properties, rank=1, preferred=None, **extras):
        
        if location.lon < -360 or 360 < location.lon:
            raise Exception('Silly human trying to pass an invalid longitude of %.3f for "%s"' % (location.lon, name))
    
        if location.lat < -90 or 90 < location.lat:
            raise Exception('Silly human trying to pass an invalid latitude of %.3f for "%s"' % (location.lat, name))
    
        self.name = name
        self.location = location
        self.position = position
        self.rank = rank
        
        self.fontfile = fontfile
        self.fontsize = fontsize
        self.properties = properties
    
        self.placement = NE
        self.radius = radius
        self.buffer = 2
        
        self._label_shapes = {}      # dictionary of label bounds by placement
        self._mask_shapes = {}       # dictionary of mask shapes by placement
        self._label_footprint = None # all possible label shapes, together
        self._mask_footprint = None  # all possible mask shapes, together
        self._point_shape = None     # point shape for current placement
        
        full_extras = 'placement' in extras \
                  and '_label_shapes' in extras \
                  and '_mask_shapes' in extras \
                  and '_label_footprint' in extras \
                  and '_mask_footprint' in extras \
                  and '_point_shape' in extras \
                  and '_placements' in extras \
                  and '_baseline' in extras
        
        if full_extras:
            # use the provided extras
            self.placement = extras['placement']
            self._label_shapes = extras['_label_shapes']
            self._mask_shapes = extras['_mask_shapes']
            self._label_footprint = extras['_label_footprint']
            self._mask_footprint = extras['_mask_footprint']
            self._point_shape = extras['_point_shape']
            self._placements = extras['_placements']
            self._baseline = extras['_baseline']

        else:
            # fill out the shapes above
            self._populate_placements(preferred)
            self._populate_shapes()

        # label bounds for current placement
        self._label_shape = self._label_shapes[self.placement]

        # mask shape for current placement
        self._mask_shape = self._mask_shapes[self.placement]

    def __repr__(self):
        return '<Place: %s>' % self.name
    
    def __hash__(self):
        return id(self)
    
    def __deepcopy__(self, memo_dict):
        """ Override deep copy to spend less time copying.
        
            Profiling showed that a significant percentage of time was spent
            deep-copying annealer state from step to step, and testing with
            z5 U.S. data shows a 4000% speed increase, so yay.
        """
        extras = dict(placement = self.placement,
                      _label_shapes = self._label_shapes,
                      _mask_shapes = self._mask_shapes,
                      _label_footprint = self._label_footprint,
                      _mask_footprint = self._mask_footprint,
                      _point_shape = self._point_shape,
                      _placements = self._placements,
                      _baseline = self._baseline)
        
        return Place(self.name, self.fontfile, self.fontsize, self.location,
                     self.position, self.radius, self.properties, self.rank, **extras)
    
    def _populate_shapes(self):
        """ Set values for self._label_shapes, _footprint_shape, and others.
        """
        point = Point(self.position.x, self.position.y)
        point_buffered = point.buffer(self.radius + self.buffer, 3)
        self._point_shape = point.buffer(self.radius, 3)
        
        scale = 10.0
        font = truetype(self.fontfile, int(self.fontsize * scale), encoding='unic')

        x, y = self.position.x, self.position.y
        w, h = font.getsize(self.name)
        w, h = w/scale, h/scale
        
        for placement in placements:
            label_shape = point_label_bounds(x, y, w, h, self.radius, placement)
            mask_shape = label_shape.buffer(self.buffer, 2).union(point_buffered)
            
            self._label_shapes[placement] = label_shape
            self._mask_shapes[placement] = mask_shape
    
        unionize = lambda a, b: a.union(b)
        self._label_footprint = reduce(unionize, self._label_shapes.values())
        self._mask_footprint = reduce(unionize, self._mask_shapes.values())
        
        # number of pixels from the top of the label based on the bottom of a "."
        self._baseline = font.getmask('.').getbbox()[3] / scale
    
    def _populate_placements(self, preferred):
        """ Set values for self._placements.
        """
        # local copy of placement energies
        self._placements = deepcopy(placements)
        
        # top right is the Imhof-approved default
        if preferred == 'top right' or not preferred:
            return
        
        # bump up the cost of every placement artificially to leave room for new preferences
        self._placements = dict([ (key, .4 + v*.6) for (key, v) in self._placements.items() ])
        
        if preferred == 'top':
            self.placement = N
            self._placements.update({ N: .0, NNW: .3, NNE: .3 })
        
        elif preferred == 'top left':
            self.placement = NW
            self._placements.update({ NW: .0, WNW: .1, NNW: .1 })
        
        elif preferred == 'bottom':
            self.placement = S
            self._placements.update({ S: .0, SSW: .3, SSE: .3 })
        
        elif preferred == 'bottom right':
            self.placement = SE
            self._placements.update({ SE: .0, ESE: .1, SSE: .1 })
        
        elif preferred == 'bottom left':
            self.placement = SW
            self._placements.update({ SW: .0, WSW: .1, SSW: .1 })
        
        else:
            raise Exception('Unknown preferred placement "%s"' % preferred)
    
    def text(self):
        """ Return text content, font file and size.
        """
        return self.name, self.fontfile, self.fontsize
    
    def label(self):
        """ Return a label polygon, the bounds of the current label shape.
        """
        return self._label_shape
    
    def registration(self):
        """ Return a registration point and text justification.
        """
        xmin, ymin, xmax, ymax = self._label_shape.bounds
        y = ymin + self._baseline
        
        if self.placement in (NNE, NE, ENE, ESE, SE, SSE):
            x, justification = xmin, 'left'

        elif self.placement in (S, N):
            x, justification = xmin/2 + xmax/2, 'center'

        elif self.placement in (SSW, SW, WSW, WNW, NW, NNW):
            x, justification = xmax, 'right'
        
        return Point(x, y), justification
    
    def footprint(self):
        """ Return a footprint polygon, the total coverage of all placements.
        """
        return self._label_footprint
    
    def move(self):
        self.placement = choice(self._placements.keys())
        self._label_shape = self._label_shapes[self.placement]
        self._mask_shape = self._mask_shapes[self.placement]
    
    def placement_energy(self):
        return self._placements[self.placement]
    
    def overlaps(self, other, reflexive=True):
        overlaps = self._mask_shape.intersects(other.label())
        
        if reflexive:
            overlaps |= other.overlaps(self, False)

        return overlaps

    def can_overlap(self, other, reflexive=True):
        can_overlap = self._mask_footprint.intersects(other.footprint())
        
        if reflexive:
            can_overlap |= other.can_overlap(self, False)

        return can_overlap

def point_label_bounds(x, y, width, height, radius, placement):
    """ Rectangular area occupied by a label placed by a point with radius.
    """
    if placement in (NE, ENE, ESE, SE):
        # to the right
        x += radius + width/2
    
    if placement in (NW, WNW, WSW, SW):
        # to the left
        x -= radius + width/2

    if placement in (NW, NE):
        # way up high
        y -= height/2

    if placement in (SW, SE):
        # way down low
        y += height/2

    if placement in (ENE, WNW):
        # just a little above
        y -= height/6

    if placement in (ESE, WSW):
        # just a little below
        y += height/6
    
    if placement in (NNE, SSE, SSW, NNW):
        _x = radius * cos(pi/4) + width/2
        _y = radius * sin(pi/4) + height/2
        
        if placement in (NNE, SSE):
            x += _x
        else:
            x -= _x
        
        if placement in (SSE, SSW):
            y += _y
        else:
            y -= _y
    
    if placement == N:
        # right on top
        y -= radius + height / 2
    
    if placement == S:
        # right on the bottom
        y += radius + height / 2
    
    x1, y1 = x - width/2, y - height/2
    x2, y2 = x + width/2, y + height/2
    
    return Polygon(((x1, y1), (x1, y2), (x2, y2), (x2, y1), (x1, y1)))

class NothingToDo (Exception):
    pass

class Places:

    def __init__(self, keep_chain=False, **extras):
        self.keep_chain = keep_chain
    
        full_extras = 'energy' in extras \
                  and 'previous' in extras \
                  and '_places' in extras \
                  and '_neighbors' in extras \
                  and '_moveable' in extras
        
        if full_extras:
            # use the provided extras
            self.energy = extras['energy']
            self.previous = extras['previous']
            self._places = extras['_places']
            self._neighbors = extras['_neighbors']
            self._moveable = extras['_moveable']

        else:
            self.energy = 0.0
            self.previous = None

            self._places = []    # core list of places
            self._neighbors = {} # dictionary of neighbor sets
            self._moveable = []  # list of only this places that should be moved

    def __iter__(self):
        return iter(self._places)
    
    def __deepcopy__(self, memo_dict):
        """
        """
        extras = dict(energy = self.energy,
                      previous = (self.keep_chain and self or None),
                      _places = deepcopy(self._places, memo_dict),
                      _neighbors = deepcopy(self._neighbors, memo_dict),
                      _moveable = deepcopy(self._moveable, memo_dict))
        
        return Places(self.keep_chain, **extras)

    def add(self, place):
        self._neighbors[place] = set()
    
        # calculate neighbors
        for other in self._places:
            if not place.can_overlap(other):
                continue

            self.energy += self._overlap_energy(place, other)

            self._moveable.append(place)
            self._neighbors[place].add(other)
            self._neighbors[other].add(place)
            
            if other not in self._moveable:
                self._moveable.append(other)

        self.energy += place.placement_energy()
        self._places.append(place)
        
        return self._neighbors[place]

    def _overlap_energy(self, this, that):
        """ Energy of an overlap between two places, if it exists.
        """
        if not this.overlaps(that):
            return 0.0

        return min(10.0 / this.rank, 10.0 / that.rank)
    
    def move(self):
        if len(self._moveable) == 0:
            raise NothingToDo('Zero places')
    
        place = choice(self._moveable)
        
        for other in self._neighbors[place]:
            self.energy -= self._overlap_energy(place, other)

        self.energy -= place.placement_energy()

        place.move()
        
        for other in self._neighbors[place]:
            self.energy += self._overlap_energy(place, other)

        self.energy += place.placement_energy()
