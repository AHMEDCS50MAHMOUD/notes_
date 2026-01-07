import 'package:flutter/material.dart';
import 'package:notes/screens/add_task_screen.dart';
import 'package:notes/widgets/app_button.dart';

class DateAndAddTaskRow extends StatelessWidget {
 final void Function()? onPressed;
  const DateAndAddTaskRow({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "October 30,2023",
          style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: Colors.black),

        ),
        SizedBox(width: 150,child: AppButton(title: "Add Task",
        onPressed:onPressed
        ),)


      ],
    );
  }
}
