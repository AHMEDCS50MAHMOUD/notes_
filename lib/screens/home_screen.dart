import 'package:flutter/material.dart';
import 'package:notes/widgets/days.dart';
import 'package:notes/widgets/tasks.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, Ahmed",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.deepPurple,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text("Have a nice day", style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: Image.asset("assets/images/bat.jpg").image,
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "October 30,2023",
                          style: TextStyle(fontSize: 27, color: Colors.black),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text("Today", style: TextStyle(fontSize: 27)),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.add, color: Colors.white, size: 22),
                        SizedBox(width: 8),
                        Text(
                          "Add Task",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    Day(month: "OCT",day: "31",weekDay: "MON",),
                    SizedBox(width: 40),
                    Day(month: "OCT",day: "31",weekDay: "TUE",),
                    SizedBox(width: 40),
                    Day(month: "NOV",day: "1",weekDay: "WED",),
                    SizedBox(width: 40),
                    Day(month: "NOV",day: "2",weekDay: "THU",),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: Tasks(),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
