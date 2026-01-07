import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes/models/task_model.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              HomeAppBar(),
              SizedBox(height: 20,),
              DateAndAddTaskRow(
                onPressed:  ()async{
                 await Navigator.push(context, MaterialPageRoute(builder:(context)=>AddTaskScreen()));
                  setState(() {

                  });

                },
              ),

              SizedBox(height: 20,),
               Row(
                  children: [
                    DateContainer(),
                    SizedBox(width: 20),
                    DateContainer(),
                    SizedBox(width: 20),
                    DateContainer(),
                    SizedBox(width: 20),
                    DateContainer(isActive: true,),
                    SizedBox(width: 20,)
                  ],
                ),
              SizedBox(height: 20,),
             Visibility(
               visible:tasks.isEmpty ,
               replacement:
             ListView.separated(
                 shrinkWrap: true,
                 physics: NeverScrollableScrollPhysics(),
                 itemBuilder: (context, index) => TaskItem(
                   task: tasks[index],
                 ),
                 itemCount: tasks.length ,
                 separatorBuilder: (context, index) => SizedBox(height: 20)
             )
             ,child:Lottie.asset("assets/images/Empty Box - Empty Search.json"),
             )
            ],
          ),
        ),
      ),
    );
  }
}
