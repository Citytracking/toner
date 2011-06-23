import sys
import glob
import os.path
import mapnik
import pyproj
import PIL.Image
import ModestMaps
import optparse

optparser = optparse.OptionParser(usage="""%prog [options]
""")

defaults = {
    'fonts': 'fonts',
    'stylesheet': 'style.xml',
    'location': (37.804325, -122.271169),
    'zoom': 10,
    'size': (1024, 768),
    'output': 'out.png'
}

optparser.set_defaults(**defaults)

optparser.add_option('-f', '--fonts', dest='fonts',
                     type='string', help='Directory name for fonts. Default value is "%(fonts)s".' % defaults)

optparser.add_option('-s', '--stylesheet', dest='stylesheet',
                     type='string', help='File name of mapnik XML file. Default value is "%(stylesheet)s".' % defaults)

optparser.add_option('-l', '--location', dest='location',
                     nargs=2, type='float', help='Latitude and longitude of map center. Default value is %.6f, %.6f.' % defaults['location'])

optparser.add_option('-z', '--zoom', dest='zoom',
                     type='int', help='Zoom level of rendered map. Default value is %(zoom)d.' % defaults)

optparser.add_option('-d', '--dimensions', dest='size',
                     nargs=2, type='int', help='Width and height of rendered map. Default value is %d, %d.' % defaults['size'])

optparser.add_option('-o', '--output', dest='output',
                     type='string', help='File name of rendered map. Default value is "%(output)s".' % defaults)

if __name__ == '__main__':

    opts, args = optparser.parse_args()

    try:
        fonts = opts.fonts
        stylesheet = opts.stylesheet
        zoom = opts.zoom
        output = opts.output
    
        center = ModestMaps.Geo.Location(*opts.location)
        dimensions = ModestMaps.Core.Point(*opts.size)
        format = output[-4:]
        
        assert zoom >= 0 and zoom <= 18
        assert format in ('.png', '.jpg')
    
        for ttf in glob.glob(os.path.join(fonts, '*.ttf')):
            mapnik.FontEngine.register_font(ttf)

    except Exception, e:
        print >> sys.stderr, e
        print >> sys.stderr, 'Usage: python mapnik-render.py <fonts dir> <stylesheet> <lat> <lon> <zoom> <width> <height> <output jpg/png>'
        sys.exit(1)

    osm = ModestMaps.OpenStreetMap.Provider()
    map = ModestMaps.mapByCenterZoom(osm, center, zoom, dimensions)
    
    srs = {'proj': 'merc', 'a': 6378137, 'b': 6378137, 'lat_0': 0, 'lon_0': 0, 'k': 1.0, 'units': 'm', 'nadgrids': '@null', 'no_defs': True}
    gym = pyproj.Proj(srs)

    northwest = map.pointLocation(ModestMaps.Core.Point(0, 0))
    southeast = map.pointLocation(dimensions)
    
    left, top = gym(northwest.lon, northwest.lat)
    right, bottom = gym(southeast.lon, southeast.lat)
    
    map = mapnik.Map(dimensions.x, dimensions.y)
    mapnik.load_map(map, stylesheet)
    map.zoom_to_box(mapnik.Envelope(left, top, right, bottom))
    
    img = mapnik.Image(dimensions.x, dimensions.y)
    
    mapnik.render(map, img)
    
    img = PIL.Image.fromstring('RGBA', (dimensions.x, dimensions.y), img.tostring())
    
    if format == '.jpg':
        img.save(output, quality=85)
    else:
        img.save(output)
