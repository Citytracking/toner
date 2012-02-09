from math import ceil, log

from shapely.geometry import Point

from ModestMaps.OpenStreetMap import Provider
from ModestMaps.Core import Coordinate

class PointIndex:
    """ Primitive quadtree for checking collisions based on a known radius.
    """
    def __init__(self, zoom, radius):
        """ Zoom is the base zoom level we're annealing to, radius is
            the pixel radius around each place to check for collisions.
        """
        self.zpixel = zoom + 8
        self.zgroup = zoom + 8 - ceil(log(radius * 2) / log(2))
        self.radius = radius
        self.quads = {}
        
        self.locationCoordinate = Provider().locationCoordinate
    
    def add(self, name, location):
        """ Add a new place name and location to the index.
        """
        coord = self.locationCoordinate(location).zoomTo(self.zpixel)
        point = Point(coord.column, coord.row)
        
        # buffer the location by radius and get its bbox
        area = point.buffer(self.radius, 4)
        xmin, ymin, xmax, ymax = area.bounds

        # a list of quads that the buffered location overlaps
        quads = [quadkey(Coordinate(y, x, self.zpixel).zoomTo(self.zgroup))
                 for (x, y) in ((xmin, ymin), (xmin, ymax), (xmax, ymax), (xmax, ymin))]
        
        # store name + area shape
        for quad in set(quads):
            if quad in self.quads:
                self.quads[quad].append((name, area))
            else:
                self.quads[quad] = [(name, area)]
    
    def blocks(self, location):
        """ If the location is blocked by some other location
            in the index, return the blocker's name or False.
        """
        coord = self.locationCoordinate(location).zoomTo(self.zpixel)
        point = Point(coord.column, coord.row)
        
        # figure out which quad the point is in
        key = quadkey(coord.zoomTo(self.zgroup))
        
        # first try the easy hash check
        if key not in self.quads:
            return False

        # then do the expensive shape check
        for (name, area) in self.quads[key]:
            if point.intersects(area):
                # ensure name evals to true
                return name or True
        
        return False

class FootprintIndex:
    """ Primitive quadtree for checking collisions based on footprints.
    """
    def __init__(self, zoom):
        """ Zoom is the base zoom level we're annealing to.
        """
        self.zpixel = zoom + 8
        self.zgroup = zoom
        self.quads = {}
        
        self.locationCoordinate = Provider().locationCoordinate
    
    def _areaQuads(self, area):
        """
        """
        xmin, ymin, xmax, ymax = area.bounds
        
        ul = Coordinate(ymin, xmin, self.zpixel).zoomTo(self.zgroup).container()
        lr = Coordinate(ymax, xmax, self.zpixel).zoomTo(self.zgroup).container()
        
        quads = set()
        
        for x in range(int(1 + lr.column - ul.column)):
            for y in range(int(1 + lr.row - ul.row)):
                coord = ul.right(x).down(y)
                quads.add(quadkey(coord))
        
        return quads
        
    def add(self, place):
        """ Add a new place to the index.
        """
        for quad in self._areaQuads(place.footprint()):
            if quad in self.quads:
                self.quads[quad].append(place)
            else:
                self.quads[quad] = [place]
    
    def blocks(self, place):
        """ If the place is blocked by some other place in
            the index, return the blocking place or False.
        """
        # figure out which quads the area covers
        quads = self._areaQuads(place.footprint())
        
        # now just the quads we already know about
        quads = [key for key in quads if key in self.quads]
        
        for key in quads:
            for other in self.quads[key]:
                if place.overlaps(other):
                    return other
        
        return False

def quadkey(coord):
    return '%(row)d-%(column)d-%(zoom)d' % coord.container().__dict__
