import requests
import os
from html.parser import HTMLParser

api_key = os.getenv('GOOGLE_API_KEY')

class MyHTMLParser(HTMLParser):
    def __init__(self):
        super().__init__()
        self.data = []

    def handleData(self, data):
        self.data.append(data)

    def getD(self):
        return ' '.join(self.data)

def formatting(raw):
    parser = MyHTMLParser()
    formatted = []

    for direction in raw:
        parser.feed(direction)
        formatted.append(parser.getD())
        parser.data = []

    return '\n'.join(formatted)

def getDirections(api_key, source, destination):
    url1 = "https://maps.googleapis.com/maps/api/directions/json?"
    params = {
        "origin": source,
        "destination": destination,
        "key": api_key
    }
    response = requests.get(url1, params=params)
    directions = response.json()
    raw = []

    if directions["status"] == "OK":
        routes = directions["routes"][0]["legs"][0]
        steps = routes["steps"]
        for step in steps:
            raw.append(step["html_instructions"])
        return raw
    else:
        print("Error:", directions["status"])
        return None

source = "Chicago, IL"
destination = "Champaign, IL"
raw1 = getDirections(api_key, source, destination)

if raw1:
    formatted_directions = formatting(raw1)
    print(formatted_directions)