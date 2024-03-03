import numpy as np
import random

class Person:
    def __init__(self, name, location, radius):
        self.name = name
        self.location = location
        self.radius = radius
    
    def gen_random_people(num_people, min_x, max_x, min_y, max_y, min_radius, max_radius):
        people = []
        for i in range(num_people):
            name = f"jit {i+1}"
            x = random.uniform(min_x, max_x)
            y = random.uniform(min_y, max_y)
            radius = random.uniform(min_radius, max_radius)
            people.append(Person(name, Point(x, y), radius))
        return people
    
    
class Place:
    def __init__(self, name, location):
        self.name = name
        self.location = location
    
    def gen_random_places(num_places, min_x, max_x, min_y, max_y):
        places = []
        for i in range(num_places):
            name = f"Place {i+1}"
            x = random.uniform(min_x, max_x)
            y = random.uniform(min_y, max_y)
            places.append(Place(name, Point(x, y)))
        return places
    
    
class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    