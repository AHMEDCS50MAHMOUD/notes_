import 'package:flutter/material.dart';


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
