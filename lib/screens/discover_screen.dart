import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  // Dummy data for the sections
  final List<Map<String, String>> circles = [
    {
      'title': 'People who love hiking in the Bay Area',
      'imagePath': 'lib/assets/hiking.png', // replace with your asset path
    },
    {
      'title': 'Foodies of San Francisco',
      'imagePath': 'lib/assets/foodies.png', // replace with your asset path
    },
    // ... add more circles
  ];

  final List<Map<String, String>> activities = [
    {
      'title': 'Hike at Muir Woods',
      'imagePath': 'lib/assets/muir_woods.png', // replace with your asset path
    },
    {
      'title': 'Yoga with a view in Berkeley',
      'imagePath': 'lib/assets/yoga.png', // replace with your asset path
    },
    // ... add more activities
  ];

  final List<Map<String, String>> events = [
    {
      'title': 'Art show in SF',
      'imagePath': 'lib/assets/art_show.png', // replace with your asset path
    },
    {
      'title': 'Music festival in Golden Gate Park',
      'imagePath': 'lib/assets/music_festival.png', // replace with your asset path
    },
    // ... add more events
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SectionTitle(title: 'Circles'),
            HorizontalList(items: circles),
            SectionTitle(title: 'Activities'),
            HorizontalList(items: activities),
            SectionTitle(title: 'Upcoming events'),
            HorizontalList(items: events),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(title, style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
    );
  }
}

class HorizontalList extends StatelessWidget {
  final List<Map<String, String>> items;

  const HorizontalList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Adjust based on your content
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0), // Adjust for rounded corners
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(item['imagePath'] ?? 'lib/assets/default_image.png', fit: BoxFit.cover),
                  Container(
                    color: Colors.black.withOpacity(0.5), // Dim the image a bit
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      item['title'] ?? 'lib/assets/default_image.png',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
