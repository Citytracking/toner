from optparse import OptionParser
from copy import copy, deepcopy
import cPickle
import json

from Dymo.anneal import Annealer
from Dymo.index import FootprintIndex
from Dymo.places import Places, NothingToDo
from Dymo import load_places, get_geometry

optparser = OptionParser(usage="""%prog [options] --labels-file <label output file> --places-file <point output file> --registrations-file <registration output file> <input file 1> [<input file 2>, ...]

There are two ways to run the label placer. The slow, default way performs a
test to figure out the best parameters for the simulated annealing algorithm
before running it. The faster, more advanced way required that you know what
your minimum and maximum temperatures and appropriate number of steps are before
you start, which usually means that you've run the annealer once the slow way
and now want to redo your results on the same data the fast way.

Input fields:

  preferred placement
    Optional preference for point placement, one of "top right" (the default),
    "top", "top left", "bottom left", "bottom", or "bottom right".

Examples:

  Place U.S. city labels at zoom 6 for two minutes:
  > python dymo-label.py -z 6 --minutes 2 --labels-file labels.json --places-file points.json data/US-z6.csv.gz

  Place U.S. city labels at zoom 5 over a 10000-iteration 10.0 - 0.01 temperature range:
  > python dymo-label.py -z 5 --steps 10000 --max-temp 10 --min-temp 0.01 -l labels.json -p points.json data/US-z5.csv""")

defaults = dict(minutes=2, dump_skip=100, include_overlaps=False, output_projected=False, name_field='name')

optparser.set_defaults(**defaults)

optparser.add_option('-m', '--minutes', dest='minutes',
                     type='float', help='Number of minutes to run annealer. Default value is %(minutes).1f.' % defaults)

optparser.add_option('-z', '--zoom', dest='zoom',
                     type='int', help='Map zoom level. Conflicts with --scale and --projection options. Default value is 18.' % defaults)

optparser.add_option('-l', '--labels-file', dest='labels_file',
                     help='Optional name of labels file to generate.')

optparser.add_option('-p', '--places-file', dest='places_file',
                     help='Optional name of place points file to generate.')

optparser.add_option('-r', '--registrations-file', dest='registrations_file',
                     help='Optional name of registration points file to generate. This file will have an additional "justified" property with values "left", "center", or "right".')

optparser.add_option('--min-temp', dest='temp_min',
                     type='float', help='Minimum annealing temperature, for more precise control than specifying --minutes.')

optparser.add_option('--max-temp', dest='temp_max',
                     type='float', help='Maximum annealing temperature, for more precise control than specifying --minutes.')

optparser.add_option('--steps', dest='steps',
                     type='int', help='Number of annealing steps, for more precise control than specifying --minutes.')

optparser.add_option('--include-overlaps', dest='include_overlaps',
                     action='store_true', help='Include lower-priority places when they overlap higher-priority places. Default behavior is to skip the overlapping cities.')

optparser.add_option('--output-projected', dest='output_projected',
                     action='store_true', help='Optionally output projected coordinates.')

optparser.add_option('--projection', dest='projection',
                     help='Optional PROJ.4 string to use instead of default web spherical mercator.')

optparser.add_option('--scale', dest='scale',
                     type='float', help='Optional scale to use with --projection. Equivalent to +to_meter PROJ.4 parameter, which is not used internally due to not quite working in pyproj. Conflicts with --zoom option. Default value is 1.')

optparser.add_option('--dump-file', dest='dump_file',
                     help='Optional filename for a sequential dump of pickled annealer states. This all has to be stored in memory, so for a large job specifying this option could use up all available RAM.')

optparser.add_option('--dump-skip', dest='dump_skip',
                     type='int', help='Optional number of states to skip for each state in the dump file.')

optparser.add_option('--name-field', dest='name_field',
                     help='Optional name of column for labels to name themselves. Default value is ||name||.' % defaults)


if __name__ == '__main__':
    
    options, input_files = optparser.parse_args()
    
    #
    # Geographic projections
    #
    
    if options.zoom is not None and options.scale is not None:
        print 'Conflicting input: --scale and --zoom can not be used together.\n'
        exit(1)
    
    if options.zoom is not None and options.projection is not None:
        print 'Conflicting input: --projection and --zoom can not be used together.\n'
        exit(1)
    
    if options.zoom is None and options.projection is None and options.scale is None:
        print 'Bad geometry input: need at least one of --zoom, --scale, or --projection.\n'
        exit(1)
    
    geometry = get_geometry(options.projection, options.zoom, options.scale)
    
    #
    # Input and output files.
    #
    
    if not input_files:
        print 'Missing input file(s).\n'
        optparser.print_usage()
        exit(1)
    
    if not (options.labels_file or options.places_file or options.registrations_file):
        print 'Missing output file(s): labels, place points, or registration points.\n'
        optparser.print_usage()
        exit(1)
    
    #
    # Load places.
    #
    
    places = Places(bool(options.dump_file))
    
    for place in load_places(input_files, geometry, options.name_field):
        places.add(place)
    
    def state_energy(places):
        return places.energy

    def state_move(places):
        places.move()

    try:
        annealer = Annealer(state_energy, state_move)
        
        if options.temp_min and options.temp_max and options.steps:
            places, e = annealer.anneal(places, options.temp_max, options.temp_min, options.steps, 30)
        else:
            places, e = annealer.auto(places, options.minutes, 500)

    except NothingToDo:
        pass
    
    label_data = {'type': 'FeatureCollection', 'features': []}
    place_data = {'type': 'FeatureCollection', 'features': []}
    rgstr_data = {'type': 'FeatureCollection', 'features': []}
    
    placed = FootprintIndex(geometry)
    
    for place in places:
        blocker = placed.blocks(place)
        overlaps = bool(blocker)
        
        if blocker:
            print place.name, 'blocked by', blocker.name
            #print place[options.name_field], 'blocked by', blocker[options.name_field]
        else:
            placed.add(place)
        
        properties = copy(place.properties)
        
        if options.include_overlaps:
            properties['overlaps'] = int(overlaps) # 1 or 0
        elif overlaps:
            continue
        
        #
        # Output slightly different geometries depending
        # on whether we want projected or geographic output.
        #
        
        label_feature = {'type': 'Feature', 'properties': properties}
        point_feature = {'type': 'Feature', 'properties': properties}

        label_feature['geometry'] = {'type': 'Polygon', 'coordinates': None}
        point_feature['geometry'] = {'type': 'Point', 'coordinates': None}

        reg_point, justification = place.registration()

        if options.output_projected:
            label_coords = list(place.label().envelope.exterior.coords)
    
            label_feature['geometry']['coordinates'] = label_coords
            label_data['features'].append(label_feature)
    
            point_feature['geometry']['coordinates'] = [place.position.x, place.position.y]
            place_data['features'].append(deepcopy(point_feature))
            
            point_feature['geometry']['coordinates'] = (reg_point.x, reg_point.y)
            
        else:
            lonlat = lambda xy: geometry.point_lonlat(xy[0], xy[1])
            label_coords = [map(lonlat, place.label().envelope.exterior.coords)]
    
            label_feature['geometry']['coordinates'] = label_coords
            label_data['features'].append(label_feature)
    
            point_feature['geometry']['coordinates'] = [place.location.lon, place.location.lat]
            place_data['features'].append(deepcopy(point_feature))
            
            point_feature['geometry']['coordinates'] = lonlat((reg_point.x, reg_point.y))

        point_feature['properties']['justified'] = justification
        rgstr_data['features'].append(point_feature)
    
    if options.labels_file:
        json.dump(label_data, open(options.labels_file, 'w'), indent=2)

    if options.places_file:
        json.dump(place_data, open(options.places_file, 'w'), indent=2)
    
    if options.registrations_file:
        json.dump(rgstr_data, open(options.registrations_file, 'w'), indent=2)
    
    if options.dump_file:
        frames = []
        
        while places.previous:
            current, places = places, places.previous
            current.previous = None # don't pickle too much per state
            frames.append(current)
        
        frames = [frames[i] for i in range(0, len(frames), options.dump_skip)]
        frames.reverse()
        
        print 'Pickling', len(frames), 'states to', options.dump_file
        
        cPickle.dump(frames, open(options.dump_file, 'w'))
