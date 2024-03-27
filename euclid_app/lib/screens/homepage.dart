import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class Course {
  final String name;
  final String room;
  final String location;
  final String syllabusUrl;
  final String homeworkUrl;
  final String calendarUrl;

  Course(
    this.name,
    this.room,
    this.location,
    this.syllabusUrl,
    this.homeworkUrl,
    this.calendarUrl,
  );
}

class _HomePageState extends State<HomePage> {
  String selectedHome = 'IDEALS';
  String studentName = 'Neil';
  final List<Course> courses = [
    Course(
      'Algebra 1 Honors',
      '1017',
      'First Floor',
      'https://images-ext-2.discordapp.net/external/uSzpKnYxrbjsx5OzLC6O7CIO3k1ckthK-YRw9LhLzz4/https/media.tenor.com/vBSimC7JzsEAAAPo/dancing-lit.mp4',
      'https://images-ext-2.discordapp.net/external/uSzpKnYxrbjsx5OzLC6O7CIO3k1ckthK-YRw9LhLzz4/https/media.tenor.com/vBSimC7JzsEAAAPo/dancing-lit.mp4',
      'https://images-ext-2.discordapp.net/external/uSzpKnYxrbjsx5OzLC6O7CIO3k1ckthK-YRw9LhLzz4/https/media.tenor.com/vBSimC7JzsEAAAPo/dancing-lit.mp4',
    ),
    Course(
      'Science Honors',
      '3079',
      'Second Floor',
      'https://images-ext-2.discordapp.net/external/uSzpKnYxrbjsx5OzLC6O7CIO3k1ckthK-YRw9LhLzz4/https/media.tenor.com/vBSimC7JzsEAAAPo/dancing-lit.mp4',
      'https://images-ext-2.discordapp.net/external/uSzpKnYxrbjsx5OzLC6O7CIO3k1ckthK-YRw9LhLzz4/https/media.tenor.com/vBSimC7JzsEAAAPo/dancing-lit.mp4',
      'https://images-ext-2.discordapp.net/external/uSzpKnYxrbjsx5OzLC6O7CIO3k1ckthK-YRw9LhLzz4/https/media.tenor.com/vBSimC7JzsEAAAPo/dancing-lit.mp4',
    ),
  ];

  bool schoolHours = false;
  @override
  Widget build(BuildContext context) {
    String fullName = 'Guest';
    String email = 'No Email';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
          selectedHome,
          style: TextStyle(color: Colors.green[300]),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(fullName),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.green[300],
                child: Text(
                  'N',
                  style: TextStyle(fontSize: 40.0, color: Colors.black),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              otherAccountsPictures: [
                IconButton(
                  icon: Icon(Icons.settings, color: Colors.white),
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.calendar_today, color: Colors.black),
              title: Text('Calendar', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pushNamed(context, '/calendar');
              },
            ),
            ListTile(
              leading: Icon(Icons.class_, color: Colors.black),
              title: Text('Courses', style: TextStyle(color: Colors.black)),
              onTap: () {
                // nav to courses
              },
            ),
            ListTile(
              leading: Icon(Icons.restaurant, color: Colors.black),
              title: Text('Meal Information', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pushNamed(context, '/mealinfo');
              },
            ),
            ListTile(
              leading: Icon(Icons.school, color: Colors.black),
              title: Text('School Information', style: TextStyle(color: Colors.black)),
              onTap: () {
                // nav to school info (boutta push soon)
              },
            ),
            ListTile(
              leading: Icon(Icons.access_time, color: Colors.black),
              title: Text('Attendance', style: TextStyle(color: Colors.black)),
              onTap: () {
                // nav to attendance
              },
            ),
            ListTile(
              leading: Icon(Icons.grade, color: Colors.black),
              title: Text('Gradebook', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pushNamed(context, '/gradebook');
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.green[300],
                child: Text(
                  fullName[0], // Use the first initial of the first name
                  style: TextStyle(fontSize: 36, color: Colors.black),
                ),
              ),
            ),
            Text(
              'Welcome, $fullName!', // Display the first name
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.green[300],
                fontWeight: FontWeight.bold,
              ),
            ),
            ...courses.map((course) => Card(
              color: Colors.grey[850],
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.name,
                      style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Room: ${course.room}',
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                    Text(
                      'Location: ${course.location}',
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    if (course.name == 'Math' && !schoolHours) ...[
                        ElevatedButton(
                        onPressed: () {
                        },
                        child: Text('Click here for Exam Practice!'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ), ), ],
                    if (schoolHours) ... [
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            // check in button stuffs
                          },
                          child: Text('Check In'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          )
                        )
                      )
                    ]
                  ]
                )
              )
            )).toList(),
          ]
        ),
      ),
    );
  }
}
