import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/contact_model.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> options = [
      {
        'color': Colors.blue,
        'icon': Icons.person_2_rounded,
        'title': "Edit Profile",
        'text': "Update your information",
        'showExpandedWidget': false,
      },
      {
        'color': Colors.deepPurpleAccent,
        'icon': Icons.settings,
        'title': "Account Settings",
        'text': "Manage your account",
        'showExpandedWidget': false,
      },
      {
        'color': Colors.green,
        'icon': Icons.notifications,
        'title': "Notifications",
        'text': "Configure alerts",
        'showExpandedWidget': true,
      },
      {
        'color': Colors.deepOrange,
        'icon': Icons.lock,
        'title': "Privacy & Security",
        'text': "Control your privacy",
        'showExpandedWidget': false,
      },
      {
        'color': Colors.blueGrey,
        'icon': Icons.question_mark_sharp,
        'title': "Help & Support",
        'text': "Get assistance",
        'showExpandedWidget': false,
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          IntrinsicHeight(
            child: Container(
              padding: EdgeInsets.all(70),
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 1000,
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      shape: .circle,
                      border: Border.all(color: Colors.grey, width: 5),
                    ),
                    child: Center(
                      child: Text(
                        contacts.first.firstName[0] +
                            contacts.first.lastName[0],
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  Text(
                    "${contacts.first.firstName} ${contacts.first.lastName}",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Text(
                    contacts.first.email,
                    style: TextStyle(fontWeight: .w500, color: Colors.white),
                  ),
                  Text(
                    contacts.first.location,
                    style: TextStyle(fontWeight: .w500, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),

          Container(
            margin: .symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: .circular(15),
              border: .all(width: 1, color: Colors.grey),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final option = options[index];

                return buildRow(
                  option['color'],
                  option['icon'],
                  option['title'],
                  option['text'],
                  showExpandedWidget: option['showExpandedWidget'],
                );
              },
              separatorBuilder: (context, index) =>
                  Divider(color: Colors.grey, thickness: 0.4),
              itemCount: options.length,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.red,
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.red.shade200),
                    ),
                    onPressed: () {},
                    label: Text("Log out"),
                    icon: Icon(Icons.exit_to_app_rounded),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),

          Center(
            child: Text(
              "App version 1.0.0",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildRow(
    Color color,
    IconData icon,
    String title,
    String text, {
    bool showExpandedWidget = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        spacing: 10,
        children: [
          Container(
            padding: .all(5),
            decoration: BoxDecoration(
              borderRadius: .circular(5),
              color: color.withValues(alpha: 0.2),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(title, style: TextStyle(fontWeight: .w400)),
                Text(text, style: TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),
          if (showExpandedWidget)
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Switch(value: true, onChanged: (value) {}),
              ),
            ),
        ],
      ),
    );
  }
}
