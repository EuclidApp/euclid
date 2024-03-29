import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.white),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration_rounded, color: Colors.white),
          label: 'Discover',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle, color: Colors.white),
          label: 'Circles',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat, color: Colors.white),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications, color: Colors.white),
          label: 'Activity',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(color: Colors.white), 
      unselectedLabelStyle: TextStyle(color: Colors.grey), 
      onTap: onItemSelected,
      showUnselectedLabels: true,
    );
  }
}
