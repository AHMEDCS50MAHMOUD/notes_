import 'package:flutter/material.dart';
import 'package:notes/widgets/app_button.dart';

class DateAndAddTaskRow extends StatelessWidget {
  final void Function()? onPressed;
  final String date;
  const DateAndAddTaskRow({super.key, this.onPressed, required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            date,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 150,
          child: AppButton(title: "Add Task", onPressed: onPressed),
        )
      ],
    );
  }
}
