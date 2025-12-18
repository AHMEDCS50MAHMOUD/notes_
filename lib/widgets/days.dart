import 'package:flutter/material.dart';



class Day extends StatelessWidget {
  final String month;
  final String day;
  final String weekDay;

  const Day({super.key,
    required this.month,
    required this.day,
    required this.weekDay,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          month,
          style: const TextStyle(color: Colors.black54, fontSize: 20,fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Text(
          day,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          weekDay,
          style: const TextStyle(color: Colors.black54, fontSize: 20,fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
