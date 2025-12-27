import 'package:flutter/material.dart';
import 'package:notes/widgets/app_button.dart';
import 'package:notes/widgets/app_text_form_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var formKey=GlobalKey<FormState>() ;
  List<MaterialColor> taskColors=[
    Colors.red,
    Colors.yellow,
    Colors.green,
  ];
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
              AppTextFormField(hintText: "Enter Task Title",),
               SizedBox(height: 20,),
               Text("Description",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
               SizedBox(height: 20,),
              AppTextFormField(hintText: "Enter Task description",
              maxLines: 3,),
               Text("Date",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20,),
              AppTextFormField(hintText: "24/12/2025",suffixIcon: const Icon(Icons.date_range),
              readOnly: true,
              onTap: (){
                showDatePicker(context: context, firstDate:DateTime.now() , lastDate: DateTime(3000)
                ,barrierDismissible: false,
          
                );
              },
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Start Time",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 16,),
                        AppTextFormField(hintText: "12:00 PM",
                          suffixIcon: const Icon(Icons.alarm),
                        readOnly: true,
                          onTap: (){
                          showTimePicker(context: context, initialTime: TimeOfDay.now());
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
                        AppTextFormField(hintText: "12:00 AM",
                          suffixIcon: const Icon(Icons.alarm),
                        readOnly: true,
                          onTap: (){showTimePicker(context: context, initialTime: TimeOfDay.now());
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
                children: List.generate(3,(index)=>CircleAvatar(
                  radius: 25,
                  backgroundColor:taskColors[index],
                ) )

                ,
              ),
              SizedBox(height: 20,),

              AppButton(title: "confirm",onPressed: (){
                formKey.currentState?.validate();

              },)
            ],
          ),
        ),
      ) ,
    );
  }
}