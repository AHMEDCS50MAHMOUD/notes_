import 'package:flutter/material.dart';


class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.deepPurple
          ),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Task Title",style: TextStyle(fontSize: 20
                          ,color: Colors.white)),
                      Text("October 30,2023",style: TextStyle(fontSize: 16
                          ,color: Colors.white)),
                      Text("Task Description",style: TextStyle(fontSize: 16
                          ,color: Colors.white)),


                    ],
                  )),
              SizedBox(width: 20,),
              Container(
                height: 50,
                width: 2,
                color: Colors.white,
              ),
              SizedBox(width: 10,),
              RotatedBox(quarterTurns: 3,
              child: Text("TODO",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white
              ),),
              )
            ],
          ),


        ));
  }
}
