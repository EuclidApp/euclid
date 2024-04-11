import firebase_integration

def basic_tests(user_id):
    preferences = firebase_integration.get_user_preferences(user_id)
    circles = firebase_integration.get_circles()
    print(preferences)
    print(circles)

def circle_test(circle_id, places):
    members = firebase_integration.get_circle_members(circle_id)
    print(members)
    firebase_integration.save_recommended_places(circle_id, places)
    print("Recommendations saved successfully!")

if __name__ == "__main__":
    basic_tests("khanapure_pass_some_id")
    circle_test("khanapure_pass_some_circle_big_bro", [{"name": "Place 1"}, {"name": "Place 2"}])