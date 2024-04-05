import numpy as np
import pandas as pd
import requests
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import linear_kernel

'''we might need to cop premium because free limit is kinda bad'''
api_key = 'API_KEY'

'''
Rec engine:
- Using a TFIDF vectorizer based system right now with content based filtering - its doing pretty well right now
- Plan to implement collaborative filtering by incorporating user/friend reviews
'''
def recommend(location = 'Champaign, IL', category = 'restaurants'):
    business_data = fetch_data(api_key, location, category)
    business_df = pd.DataFrame(business_data)
    business_df = business_df[['id', 'name', 'categories', 'rating', 'review_count']]
    business_df['tags'] = business_df['categories'].apply(lambda x: ', '.join([c['title'] for c in x]))

    user_prefs = get_user_prefs()

    tfidf_vectorizer = TfidfVectorizer(stop_words='english')
    tfidf_matrix = tfidf_vectorizer.fit_transform(business_df['tags'])

    user_tags_str = ', '.join(user_prefs['tags'])
    user_tfidf = tfidf_vectorizer.transform([user_tags_str])
    cosine_similarities = linear_kernel(user_tfidf, tfidf_matrix).flatten()

    recommended_indices = cosine_similarities.argsort()[::-1]
    recommended_businesses = business_df.iloc[recommended_indices]
    recommended_businesses = recommended_businesses[recommended_businesses['rating'] >= user_prefs['min_rating']]
    return recommended_businesses[['name', 'tags', 'rating', 'review_count']].head(10)

'''
Fetching business data using the yelp API in batches
'''
def fetch_data(key, location, category):
    url = f'https://api.yelp.com/v3/businesses/search'
    headers = {'Authorization': f'Bearer {key}'}
    data = []
    # Imma fetch fiddy at a time to get thousand
    for offset in range(0, 200, 50):
        params = {'location': location, 'categories': category, 'limit': 50, 'offset': offset}
        response = requests.get(url, headers=headers, params=params)
        data += response.json()['businesses']
    return data

'''
Getting the user preferences as input
'''
def get_user_prefs():
    tags = [tag.strip() for tag in input("preferences: ").split(',')]
    min_rating = float(input("min rating: ").strip())
    return {'tags': tags, 'min_rating': min_rating}