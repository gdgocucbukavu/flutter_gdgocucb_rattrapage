import 'package:flutter/material.dart';

class ForecastRow extends StatelessWidget {
  final String day;
  final IconData icon;
  final String high;
  final String low;

  const ForecastRow({
    super.key,
    required this.day,
    required this.icon,
    required this.high,
    required this.low,
  });

  @override
  Widget build(Buildontext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        SizedBox(
          width: 50,
          child: Text(day, style: const TextStyle(fontSize: 16)),
        ),
        Icon(icon, color: Colors.blue),
        SizedBox(
          width: 60,
          child: Row(
            mainAxisAlignment: .end,
            children: [
              Text(high, style: const TextStyle(fontWeight: .bold)),
              const SizedBox(width: 10),
              Text(low, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ],
    );
  }
}
