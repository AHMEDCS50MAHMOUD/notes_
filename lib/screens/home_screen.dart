import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:notes/app_strings.dart';
import 'package:notes/models/task_model.dart';
import 'package:notes/models/user_model.dart';
import 'package:notes/widgets/date_and_add_task_row.dart';
import 'package:notes/widgets/date_container.dart';
import 'package:notes/widgets/home_app_bar.dart';
import 'package:notes/widgets/task_item.dart';

import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserModel? user = Hive.box<UserModel>("user").getAt(0);
  List<String> statusList = ["All", "TODO", "Complete"];
  int currentActiveIndex = 0;
  List<TaskModel> tasks = [];
  @override
  Widget build(BuildContext context) {
    if (currentActiveIndex == 0) {
      tasks = Hive.box<TaskModel>(AppStrings.tasksBox).values.toList();
    } else if (currentActiveIndex == 1) {
      tasks = Hive.box<TaskModel>(AppStrings.tasksBox)
          .values
          .toList()
          .where((e) => e.statusTExt.toLowerCase() == "todo")
          .toList();
    } else {
      tasks = Hive.box<TaskModel>(AppStrings.tasksBox)
          .values
          .toList()
          .where((e) => e.statusTExt.toLowerCase() == "complete")
          .toList();
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              HomeAppBar(
                user: user!,
              ),
              const SizedBox(
                height: 20,
              ),
              DateAndAddTaskRow(
                onPressed: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddTaskScreen()));
                  setState(() {});
                },
                date: DateFormat.yMMMMd().format(DateTime.now()),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: List.generate(
                    statusList.length,
                    (index) => DateContainer(
                          statusText: statusList[index],
                          isActive: currentActiveIndex == index,
                          onTap: () {
                            setState(() {
                              currentActiveIndex = index;
                            });
                          },
                        )),
              ),
              const SizedBox(width: 20),
              Visibility(
                visible: tasks.isEmpty,
                replacement: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => TaskItem(
                          task: tasks[index],
                          onDismissed: (direction) {
                            if (direction == DismissDirection.startToEnd) {
                              deleteTask(index);
                            } else {
                              updateTaskStatus(index);
                            }
                          },
                        ),
                    itemCount: tasks.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20)),
                child: Lottie.asset("assets/images/Empty Box - Empty Search.json"),
              )
            ],
          ),
        ),
      ),
    );
  }

  var myBox = Hive.box<TaskModel>(AppStrings.tasksBox);
  deleteTask(int index) {
    myBox.deleteAt(index);
    setState(() {});
  }

  updateTaskStatus(
    int index,
  ) {
    TaskModel? updateTask = myBox.getAt(index);
    updateTask?.statusTExt = "Complete";

    updateTask?.save();
    setState(() {});
  }
}
