import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF6200EE),
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: .symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                const Text(
                  '5 notifications',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Clear all',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView(
              children: const [
                NotificationTile(
                  icon: Icons.music_note,
                  iconColor: Colors.purple,
                  title: 'Now Playing',
                  subtitle: 'Blinding Lights - The Weeknd',
                  time: '2 min ago',
                ),
                NotificationTile(
                  icon: Icons.cloud_outlined,
                  iconColor: Colors.blue,
                  title: 'Weather Alert',
                  subtitle: 'Rain expected this afternoon',
                  time: '1 hour ago',
                ),
                NotificationTile(
                  icon: Icons.person_add_outlined,
                  iconColor: Colors.green,
                  title: 'New Contact',
                  subtitle: 'Sarah Johnson added to contacts',
                  time: '3 hours ago',
                ),
                NotificationTile(
                  icon: Icons.chat_bubble_outline,
                  iconColor: Colors.orange,
                  title: 'Message',
                  subtitle: 'You have 3 unread messages',
                  time: '5 hours ago',
                ),
                NotificationTile(
                  icon: Icons.mail_outline,
                  iconColor: Colors.red,
                  title: 'Email',
                  subtitle: 'New email from work@company.com',
                  time: 'Yesterday',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
