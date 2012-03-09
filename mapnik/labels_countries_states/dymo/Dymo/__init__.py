from gzip import GzipFile
from csv import DictReader
from os.path import splitext
from math import log, pi
from re import compile

from ModestMaps.Geo import Location
from ModestMaps.OpenStreetMap import Provider
from ModestMaps.Core import Point, Coordinate

try:
    import pyproj
except ImportError:
    # don't worry about it until GeometryCustom is actually instantiated.
    pass

from .places import Place

__version__ = 'N.N.N'

_osm = Provider()

key_pat = compile(r'\W')
int_pat = compile(r'^-?\d{1,9}$') # up to nine so we don't cross 2^32
float_pat = compile(r'^-?\d+(\.\d+)?$')

class GeometryWebmercator:
    """
    """
    def __init__(self, zoom):
        """
        """
        self.zoom = zoom
        self.radius = 2 ** (zoom + 7)
    
    def location_point(self, lat, lon):
        """ Return a location and point object for the lat, lon pair.
        """
        try:
            location = Location(float(lat), float(lon))
            coord = _osm.locationCoordinate(location).zoomTo(self.zoom + 8)
            point = Point(coord.column - self.radius, self.radius - coord.row)
            
            return location, point
    
        except ValueError:
            raise Exception((lat, lon, zoom))
    
    def point_lonlat(self, x, y):
        """ Return a longitude, latitude tuple from pixels.
        """
        try:
            coord = Coordinate(self.radius - y, x + self.radius, self.zoom + 8)
            location = _osm.coordinateLocation(coord)
            
            return location.lon, location.lat
    
        except ValueError:
            raise Exception((x, y, zoom))

class GeometryCustom:
    """
    """
    def __init__(self, projection, scale):
        """
        """
        if 'pyproj' not in globals():
            raise ImportError('No module named pyproj')
        
        self.proj = pyproj.Proj(projection)
        self.scale = float(scale)
    
    def location_point(self, lat, lon):
        """ Return a location and point object for the lat, lon pair.
        """
        location = Location(float(lat), float(lon))
        x, y = self.proj(location.lon, location.lat)
        point = Point(x/self.scale, y/self.scale)

        return location, point
    
    def point_lonlat(self, x, y):
        """ Return a longitude, latitude tuple from pixels.
        """
        return self.proj(x*self.scale, y*self.scale, inverse=True)

def row_location(row):
    """ Return a floating point latitude, longitude pair from a row.
    """
    if 'latitude' in row:
        lat = row['latitude']
    elif 'LATITUDE' in row:
        lat = row['LATITUDE']
    elif 'lat' in row:
        lat = row['lat']
    elif 'LAT' in row:
        lat = row['LAT']
    else:
        raise Exception('Missing "latitude" or "lat" field in row')

    if 'longitude' in row:
        lon = row['longitude']
    elif 'LONGITUDE' in row:
        lon = row['LONGITUDE']
    elif 'long' in row:
        lon = row['long']
    elif 'LONG' in row:
        lon = row['LONG']
    elif 'lon' in row:
        lon = row['lon']
    elif 'LON' in row:
        lon = row['LON']
    else:
        raise Exception('Missing "longitude", "long", or "lon" field in row')
    
    return float(lat), float(lon)

def get_geometry(projection, zoom, scale):
    """ Return an appropriate geometry class for a combination of factors.
    
        This function assumes that illegal combinations such as zoom
        and scale or projection and zoom have already been filtered out.
    """
    if projection is not None and scale is not None:
        return GeometryCustom(projection, scale)
    
    elif projection is not None:
        return GeometryCustom(projection, 1.0)
    
    elif scale is not None:
        zoom = log(2 * 6378137 * pi / scale) / log(2)
        return GeometryWebmercator(zoom)
    
    elif zoom is not None:
        return GeometryWebmercator(zoom)
    
    else:
        return GeometryWebmercator(18)
    
def label_bbox(shape, zoom):
    """ Return an envelope in geographic coordinates based on a shape in pixels at a known zoom level.
    """
    pass

def load_places(input_files, geometry, field_name):
    """
    """
    for input_file in input_files:
        name, ext = splitext(input_file)
    
        if ext == '.gz':
            input = GzipFile(input_file, 'r')
            input_file = name
        else:
            input = open(input_file, 'r')
    
        name, ext = splitext(input_file)
        
        if ext == '.csv':
            dialect = 'excel'
        elif ext in ('.tsv', '.txt'):
            dialect = 'excel-tab'
        
        rows = list(DictReader(input, dialect=dialect))
        types = dict()
        
        for row in rows:
            for (key, value) in row.items():
                if int_pat.match(value):
                    if key not in types:
                        types[key] = int
                elif float_pat.match(value):
                    if key not in types or types[key] is int:
                        types[key] = float
                else:
                    # it's not really a type, but it's like unicode()
                    types[key] = lambda s: s.decode('utf-8')
        
        for row in rows:
            name = row[ field_name ].decode('utf-8')
            radius = int(row.get('point size', 8))
            
            fontsize = int(row.get('font size', 12))
            fontfile = row.get('font file', 'fonts/DejaVuSans.ttf')
            
            location, point = geometry.location_point(*row_location(row))
            
            properties = dict([(key_pat.sub(r'_', key), types[key](value))
                               for (key, value) in row.items()
                               if key not in ('latitude', 'longitude')])
            
            kwargs = dict()
            
            if 'preferred placement' in row:
                kwargs['preferred'] = row['preferred placement']
            
            yield Place(name, fontfile, fontsize, location, point, radius, properties, **kwargs)
