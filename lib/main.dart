

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/app_strings.dart';
import 'package:notes/models/task_model.dart';
import 'package:notes/models/user_model.dart';
import 'package:notes/notes.dart';



void main()async{
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());
 await Hive.openBox<UserModel>(AppStrings.userBox);
  await Hive.openBox<TaskModel>(AppStrings.tasksBox);
 runApp(Notes());
}