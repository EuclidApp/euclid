import 'package:flutter/material.dart';
import 'package:euclid/navbar.dart';

class CirclesScreen extends StatefulWidget {
  @override
  _CirclesScreenState createState() => _CirclesScreenState();
}

class _CirclesScreenState extends State<CirclesScreen> {
  int _selectedIndex = 2; // Index for Circles tab, assuming it's the third item

  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Here, you would also handle the navigation logic to switch between the screens.
      // For example, you could use a switch statement and Navigator to change the screen.
      // Navigator.pushReplacement(...); // or Navigator.push(...);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circles'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView( // Use SingleChildScrollView for a scrollable page
        child: Column(
          children: <Widget>[
            // Here you'd build out your list of past and current circles, similar to the structure in the Airbnb 'Your Trips' screen.
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onNavBarItemTapped,
      )
    );
  }
}

// Make sure the navbar.dart file is located where you're importing it from.
// Adjust the _selectedIndex to the index of your Circles tab if it's not the third one.
// Implement navigation logic in _onNavBarItemTapped based on how your app navigates between screens.
