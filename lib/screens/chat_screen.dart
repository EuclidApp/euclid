import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  // Dummy chat data
  final List<Map<String, dynamic>> chats = [
    {
      'name': 'Mommy',
      'message': 'I am going to Austin on Saturday...',
      'time': '12:30 PM',
      'profileImage': 'assets/profile_mommy.png', // Replace with actual image asset
    },
    {
      'name': 'Mommy',
      'message': 'I am going to Austin on Saturday...',
      'time': '12:30 PM',
      'profileImage': 'assets/profile_mommy.png', // Replace with actual image asset
    },
    {
      'name': 'Mommy',
      'message': 'I am going to Austin on Saturday...',
      'time': '12:30 PM',
      'profileImage': 'assets/profile_mommy.png', // Replace with actual image asset
    },
    {
      'name': 'Mommy',
      'message': 'I am going to Austin on Saturday...',
      'time': '12:30 PM',
      'profileImage': 'assets/profile_mommy.png', // Replace with actual image asset
    },
    {
      'name': 'Mommy',
      'message': 'I am going to Austin on Saturday...',
      'time': '12:30 PM',
      'profileImage': 'assets/profile_mommy.png', // Replace with actual image asset
    },
    {
      'name': 'Mommy',
      'message': 'I am going to Austin on Saturday...',
      'time': '12:30 PM',
      'profileImage': 'assets/profile_mommy.png', // Replace with actual image asset
    },
    {
      'name': 'Mommy',
      'message': 'I am going to Austin on Saturday...',
      'time': '12:30 PM',
      'profileImage': 'assets/profile_mommy.png', // Replace with actual image asset
    },
    {
      'name': 'Mommy',
      'message': 'I am going to Austin on Saturday...',
      'time': '12:30 PM',
      'profileImage': 'assets/profile_mommy.png', // Replace with actual image asset
    },
    {
      'name': 'Mommy',
      'message': 'I am going to Austin on Saturday...',
      'time': '12:30 PM',
      'profileImage': 'assets/profile_mommy.png', // Replace with actual image asset
    },
    {
      'name': 'Mommy',
      'message': 'I am going to Austin on Saturday...',
      'time': '12:30 PM',
      'profileImage': 'assets/profile_mommy.png', // Replace with actual image asset
    },
    {
      'name': 'Mommy',
      'message': 'I am going to Austin on Saturday...',
      'time': '12:30 PM',
      'profileImage': 'assets/profile_mommy.png', // Replace with actual image asset
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color to black
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(chat['profileImage']), // Profile image for each chat
            ),
            title: Text(
              chat['name'],
              style: TextStyle(color: Colors.white), // Chat title
            ),
            subtitle: Text(
              chat['message'],
              style: TextStyle(color: Colors.grey), // Chat message preview
            ),
            trailing: Text(
              chat['time'],
              style: TextStyle(color: Colors.grey, fontSize: 12), // Chat time
            ),
          );
        },
      ),
    );
  }
}
