import 'package:flutter/material.dart';
import 'package:notes/widgets/date_and_add_task_row.dart';
import 'package:notes/widgets/date_container.dart';
import 'package:notes/widgets/home_app_bar.dart';
import 'package:notes/widgets/task_item.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              DateAndAddTaskRow(),

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
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => TaskItem(),
                itemCount: 10,
                separatorBuilder: (context, index) => SizedBox(height: 20)
              )
            ],
          ),
        ),
      ),
    );
  }
}
