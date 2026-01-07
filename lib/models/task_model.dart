


import 'package:flutter/material.dart';

class TaskModel{
String taskTitle;
String date;
String startTime;
String endTime;
String description;
String statusTExt;
Color color;

TaskModel({required this.taskTitle, required this.date,required this.startTime,required this.endTime,
  required this.description,required this.statusTExt,required this.color});


}
List<TaskModel> tasks=[

];