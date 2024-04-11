import firebase_admin
from firebase_admin import credentials, db

cred = credentials.Certificate('path/to/serviceAccountKey.json')
firebase_admin.initialize_app(cred, {
    'databaseURL': 'https://euclid-28893-default-rtdb.firebaseio.com/'
})

def get_user_preferences(user_id):
    ref = db.reference(f'user/{user_id}/preferences')
    return ref.get()

def get_circles():
    ref = db.reference('circle')
    return ref.get()

def get_circle_members(circle_id):
    ref = db.reference(f'circle/{circle_id}/members')
    return ref.get()

def save_recommended_places(circle_id, places):
    ref = db.reference(f'circle/{circle_id}/recommendations')
    ref.set(places)