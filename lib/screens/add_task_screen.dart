import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:notes/app_strings.dart';
import 'package:notes/widgets/app_button.dart';
import 'package:notes/widgets/app_text_form_field.dart';

import '../models/task_model.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var formKey=GlobalKey<FormState>() ;
  List<MaterialColor> taskColors=[
    Colors.yellow,
    Colors.deepPurple,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.brown
  ];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  int activeColorIndex=-1;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.deepPurple),
      titleTextStyle: const TextStyle(
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold,
        fontSize: 20
      ),
      title: const Text("Add Task"),
        centerTitle: true,

      ),
      body:SingleChildScrollView(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key:formKey ,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text("Title",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),
               SizedBox(height: 10,),
              AppTextFormField(
                controller: titleController,
                hintText: "Enter Task Title",),
               SizedBox(height: 20,),
               Text("Description",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
               SizedBox(height: 20,),
              AppTextFormField(
                controller: descriptionController,
                hintText: "Enter Task description",
              maxLines: 3,),
               Text("Date",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20,),
              AppTextFormField(
                controller: dateController,
                hintText: "24/12/2025",suffixIcon: const Icon(Icons.date_range),
              readOnly: true,
              onTap: (){
                showDatePicker(context: context, firstDate:DateTime.now() , lastDate: DateTime(3000)
                ,barrierDismissible: false,
          
                ).then((value){
                  dateController.text=DateFormat.yMMMd().format(value??DateTime.now());
                });
              },
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Start Time",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 16,),
                        AppTextFormField(
                          controller: startTimeController,
                          hintText: "12:00 PM",
                          suffixIcon: const Icon(Icons.alarm),
                        readOnly: true,
                          onTap: (){
                          showTimePicker(context: context,
                              initialTime: TimeOfDay.now()).then((value){
                                startTime=value;

                           startTimeController.text=value?.format(context)?? "";

                          });
                          },
                        ),
                              const SizedBox(height: 20,),
                      ],
          
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("End Time",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 16,),
                        AppTextFormField(
                          controller: endTimeController,
                          hintText: "12:00 AM",
                          validator: (v){
                            if(startTime!=null)
                            { if(endTime?.isBefore(startTime!)??false){
                            return "End Time must be after Start Time";
                            }
                            }
                          },
                          suffixIcon: const Icon(Icons.alarm),
                        readOnly: true,
                          onTap: (){showTimePicker(context: context,
                              initialTime: TimeOfDay.now()).then((value){
                                endTime=value;

                            endTimeController.text=value?.format(context)?? "";

                          });
                          },
                        ),
                        const SizedBox(height: 20,),
                      ],
          
                    ),
                  )
                ],
              ),
               SizedBox(height: 20,),
              Row(
                children: List.generate(taskColors.length,(index)=>InkWell(
                  onTap: (){
                    setState(() {
                      activeColorIndex=index;
                    });
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor:taskColors[index],
                    child:activeColorIndex==index? Icon(Icons.check,color: Colors.white,):null,
                  ),
                ) )

                ,
              ),
              SizedBox(height: 20,),

              AppButton(title: "Confirm",onPressed: (){
                if((formKey.currentState?.validate()??false)){
                  if(activeColorIndex==-1){
                    showDialog(context: context, builder: (context)=>AlertDialog(
                      title: Text("Error!"),
                      content: Text(" Please select a color"),

                      
                    ));
                    return;
                    
                  }


                Hive.box<TaskModel>(AppStrings.tasksBox).add(TaskModel(taskTitle: titleController.text,
                      date: dateController.text,
                      startTime: startTimeController.text,
                      endTime: endTimeController.text,
                      description: descriptionController.text,
                      statusTExt:"TODO" ,
                      color: taskColors[activeColorIndex].toARGB32())).then((v){  Navigator.pop(context);});

                }


              },)
            ],
          ),
        ),
      ) ,
    );
  }
}