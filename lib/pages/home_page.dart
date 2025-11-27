import 'package:flutter/material.dart';
import 'package:flutter_gdgocucb_rattrapage/pages/contacts_page.dart';
import 'package:flutter_gdgocucb_rattrapage/router/routes_config.dart';
import 'package:flutter_gdgocucb_rattrapage/router/routes_names.dart';

import '../widgets/widgets.dart';
import '../extensions.dart';

const activityIcons = [
  Icons.music_note_outlined,
  Icons.people_outline,
  Icons.notifications_outlined,
];

const List<MaterialColor> activityColors = [
  Colors.purple,
  Colors.green,
  Colors.lightBlue,
];
const activityTitles = [
  "Listened to Spotify",
  "Added 3 new contacts",
  "5 new notifications",
];
const activitySubTitles = ["2 hours ago", "5 hours ago", "1 day ago"];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Home"),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
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
                    Icon(Icons.calendar_today_outlined, size: 20),
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
                context,
                color: Colors.blue,
                icon: Icons.people_outline,
                title: "Contact",
                number: "248",
                onTap: () {
                  // goRouter.pushNamed(RoutesNames.contacts );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactsPage()),
                  );
                },
              ),
              _bodyRowContainer(
                context,
                color: Colors.orange,
                icon: Icons.music_note_outlined,
                title: "Playlist",
                number: "32",
                onTap: () {},
              ),
            ],
          ).bottomGap(),
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
                        Icon(Icons.cloud_outlined, size: 20),
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
          ).bottomGap(),
          Text("Recent Activity").bottomGap(),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: List.generate(3, (index) {
                return Row(
                  spacing: 8,
                  children: [
                    customIconContainer(
                      icon: activityIcons[index],
                      color: activityColors[index],
                    ),
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(activityTitles[index]),
                        Text(
                          activitySubTitles[index],
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ).bottomGap(index == 2 ? 0 : 16);
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bodyRowContainer(
    dynamic context, {
    required String title,
    required String number,
    required IconData icon,
    required MaterialColor color,
    required void Function()? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color, width: 0.5),
          ),
          child: Row(
            spacing: 8,
            children: [
              customIconContainer(isFirst: true, color: color, icon: icon),
              Column(
                crossAxisAlignment: .start,
                children: [Text(title), Text(number)],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
