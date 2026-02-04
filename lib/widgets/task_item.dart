import 'package:flutter/material.dart';
import 'package:notes/models/task_model.dart';




class TaskItem extends StatelessWidget {
 final TaskModel task;
 final void Function(DismissDirection)? onDismissed;
  const TaskItem({super.key, required this.task, this.onDismissed});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          height: 111,
          color: Colors.red,
          child: Icon(Icons.delete,color: Colors.white,),
        ),
        secondaryBackground: Container(
          height: 111,
          color: Colors.green,
          child: Icon(Icons.incomplete_circle,color: Colors.white,),
        ),
        behavior: HitTestBehavior.translucent,
        onDismissed:onDismissed ,
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(task.color),
          ),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task.taskTitle,style: TextStyle(fontSize: 20
                          ,color: Colors.white)),
                      Text("${task.date}-${task.startTime}",style: TextStyle(fontSize: 16
                          ,color: Colors.white)),
                      Text(task.description,style: TextStyle(fontSize: 16
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
              child: Text(task.statusTExt,style: TextStyle(
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
