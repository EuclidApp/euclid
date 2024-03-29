import 'package:flutter/material.dart';
import 'package:euclid/navbar.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> groups = [
    {
      'name': 'Naya Indian Cuisine',
      'members': '1.4k',
      'image': 'lib/assets/nayauiuc.jpeg',
    },
    {
      'name': 'Bangkok Thai',
      'members': '2.3K',
      'image': 'lib/assets/bangkokthai.jpeg',
    },
    // Add more group data here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView( // Use SingleChildScrollView to allow the entire page to scroll
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Welcome to Euclid!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Text(
              'Create or Join a Circle to get started.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 20),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Action for Start a new Circle button
                    },
                    child: Text('Create a Circle'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Action for Join Circle button
                    },
                    child: Text('Join a Circle'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
            SizedBox(height: 20), // Spacing between buttons and 'For You' title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'For You',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true, // Use this to make ListView take the space it needs
              itemCount: groups.length,
              itemBuilder: (context, index) {
                final group = groups[index];
                return GroupCard(
                  groupName: group['name'],
                  membersCount: group['members'],
                  imagePath: group['image'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


class GroupCard extends StatelessWidget {
  final String groupName;
  final String membersCount;
  final String imagePath;

  const GroupCard({
    Key? key,
    required this.groupName,
    required this.membersCount,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: <Widget>[
          Image.asset(imagePath), // Image at the top of the card
          ListTile(
            title: Text(groupName, style: TextStyle(color: Colors.white)),
            subtitle: Text('$membersCount members', style: TextStyle(color: Colors.white70)),
          ),
        ],
      ),
    );
  }
}