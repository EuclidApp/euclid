from models import Person, Place, Point
import numpy as np
import plotly.graph_objects as go

class SpatialHash:
    def __init__(self, width, height, cell_size):
        self.width = width
        self.height = height
        self.cell_size = cell_size
        self.grid = {}


    def hash_function(self, location):
        return int(location.x / self.cell_size), int(location.y / self.cell_size)


    def insert(self, item):
        cell_x, cell_y = self.hash_function(item.location)
        if (cell_x, cell_y) not in self.grid:
            self.grid[(cell_x, cell_y)] = []
        self.grid[(cell_x, cell_y)].append(item)


    def query(self, location, radius):
        results = set()
        x, y = location.x, location.y
        min_cell_x, min_cell_y = self.hash_function(Point(x - radius, y - radius))
        max_cell_x, max_cell_y = self.hash_function(Point(x + radius, y + radius))
        for cell_x in range(min_cell_x, max_cell_x + 1):
            for cell_y in range(min_cell_y, max_cell_y + 1):
                if (cell_x, cell_y) in self.grid:
                    for item in self.grid[(cell_x, cell_y)]:
                        if np.linalg.norm(np.array([x, y]) - np.array([item.location.x, item.location.y])) <= radius:
                            results.add(item)
        
        return results


    def test(self, people, places, spatial_hash):
        for place in places:
            spatial_hash.insert(place)

        for person in people:
            overlapping_places = spatial_hash.query(person.location, person.radius)
            
            # Imma add some of the closest places to a given person to the list of overlapping places, so that everyone has places to go to
            distances = []
            for place in places:
                dist = np.linalg.norm(np.array([person.location.x, person.location.y]) - np.array([place.location.x, place.location.y]))
                distances.append((dist, place))
        
            num_to_add = int(0.4 * len(places))
            closest_places = sorted(distances)[0:num_to_add]
            
            for dist, place in closest_places:
                overlapping_places.add(place)
            
            print(f"{person.name} should consider these places:", [place.name for place in overlapping_places])

        self.visualize_matches(people, places)
        
        
    def visualize_matches(self, people, places):
        fig = go.Figure()

        for place in places:
            fig.add_trace(go.Scatter(x = [place.location.x], y = [place.location.y], mode = 'markers', marker = dict(color = 'blue', symbol = 'square', size = 10), name=place.name))

        for person in people:
            fig.add_trace(go.Scatter(x = [person.location.x], y = [person.location.y], mode = 'markers', marker = dict(color = 'red', symbol = 'circle', size = 10), name = person.name))
            fig.add_shape(type = "circle", x0 = person.location.x - person.radius, y0 = person.location.y - person.radius, x1 = person.location.x + person.radius, y1 = person.location.y + person.radius, line = dict(color='green', width=2), opacity=0.3)

        fig.update_layout(title='Matches between People and Places', xaxis_title='X-coordinate', yaxis_title='Y-coordinate', showlegend=True)
        fig.show()
            
            
places = Place.gen_random_places(5, 0, 20, 0, 20)
people = Person.gen_random_people(5, 0, 20, 0, 20, 2, 5)
spatial_hash = SpatialHash(width=100, height=100, cell_size=10)
spatial_hash.test(people, places, spatial_hash)
