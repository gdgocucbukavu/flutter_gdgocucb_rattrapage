import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade200,
        title: Text("Home"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_rounded)),
          Container(
            margin: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              child: Text("GB", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 16,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: .start,
                spacing: 8,
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      Icon(Icons.calendar_today_outlined),
                      Text("Tuesday, November 25, 2025"),
                    ],
                  ),
                  Text(
                    "Welcome Back!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text("Here's what's happening today"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              spacing: 16,
              children: [
                _bodyRowContainer(
                  color: Colors.blue,
                  icon: Icons.people_outline_rounded,
                  title: "Contact",
                  number: "248",
                ),
                _bodyRowContainer(
                  color: Colors.orange,
                  icon: Icons.music_note_outlined,
                  title: "Playlist",
                  number: "32",
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          Icon(Icons.cloud_outlined),
                          Text("Current Weather"),
                        ],
                      ),
                      Text("Bukavu, DRC"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        "22°C",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                        ),
                      ),
                      Text("High: 25° Low: 18°"),
                    ],
                  ),
                  Text("Partly Cloudy"),
                ],
              ),
            ),
            Text("Recent Activity"),
          ],
        ),
      ),
    );
  }

  Widget _bodyRowContainer({
    required String title,
    required String number,
    required IconData icon,
    required MaterialColor color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          spacing: 8,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon),
            ),
            Column(
              crossAxisAlignment: .start,
              children: [Text(title), Text(number)],
            ),
          ],
        ),
      ),
    );
  }
}
