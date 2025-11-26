import 'package:flutter/material.dart';

Widget customIconContainer({
  required IconData icon,
  required MaterialColor color,
  bool isFirst = false,
}) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: isFirst ? color : color.shade50,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Icon(icon, size: isFirst ? 20 : 14, color: isFirst ? null : color),
  );
}
