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
            children: const [
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
        const SizedBox(width: 10),
        IconButton(
          icon: const Icon(Icons.info_outline, color: Colors.deepPurple),
          onPressed: () {
            showAboutDialog(
              context: context,
              applicationName: 'Notes App',
              applicationVersion: '1.0.0',
              applicationLegalese: 'Copyright © 2026',
              children: const [
                SizedBox(height: 24),
                Text('Developer: Ahmed Darwish'),
                Text('Email: ahmed.mahmoud.40rhh@gmail.com'),
                Text('Phone: +201143621765'),
              ],
            );
          },
        ),
        const SizedBox(width: 10),
        CircleAvatar(
          radius: 30,
          backgroundImage: Image.asset("assets/images/bat.jpg").image,
        ),
      ],
    );
  }
}
