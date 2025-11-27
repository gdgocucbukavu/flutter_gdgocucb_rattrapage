import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String time;

  const NotificationTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: .symmetric(horizontal: 16, vertical: 8),
          leading: Icon(icon, color: iconColor, size: 28),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Padding(
            padding: .only(top: 4.0),
            child: Text(subtitle, style: TextStyle(color: Colors.grey[600])),
          ),
          trailing: Text(
            time,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
        const Divider(height: 1, indent: 70),
      ],
    );
  }
}
