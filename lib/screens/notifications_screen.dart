import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This data would typically come from your app's backend or state management solution
    final List<Map<String, dynamic>> notifications = [
      {
        'user': 'Alex',
        'action': 'and 3 others joined the group',
        'time': '4d',
        'profileImage': 'assets/profile_alex.png', // Replace with your asset path
      },
      {
        'user': 'You',
        'action': 'have 2 new messages',
        'time': '7d',
        'profileImage': 'assets/profile_user.png', // Replace with your asset path
      },
      // ... other notifications
    ];

    // Example circle history, to be replaced with your actual data
    final List<Map<String, dynamic>> circleHistory = [
      {
        'title': 'Aileen posted a new event',
        'time': '10d',
      },
      // ... other circle history items
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Notifications',
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          ),
          ...notifications.map((notification) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(notification['profileImage']), // Replace with actual image provider
              ),
              title: Text(
                notification['user'],
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                notification['action'],
                style: TextStyle(color: Colors.white70),
              ),
              trailing: Text(
                notification['time'],
                style: TextStyle(color: Colors.white70),
              ),
            );
          }).toList(),
          Divider(color: Colors.white24),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Circle History',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ...circleHistory.map((history) {
            return ListTile(
              title: Text(
                history['title'],
                style: TextStyle(color: Colors.white),
              ),
              trailing: Text(
                history['time'],
                style: TextStyle(color: Colors.white70),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
