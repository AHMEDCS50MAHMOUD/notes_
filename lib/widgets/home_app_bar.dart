import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/app_strings.dart';
import 'package:notes/models/user_model.dart';
import 'package:notes/screens/auth_screen.dart';


class HomeAppBar extends StatelessWidget {
  final UserModel user;

  const HomeAppBar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, ${user.name}",
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.deepPurple,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Text("Have a nice day", style: TextStyle(fontSize: 18)),
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
          backgroundImage: FileImage(File(user.image)),
        ),
        IconButton(
            onPressed: () {
              Hive.box<UserModel>(AppStrings.userBox).clear();
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => const AuthScreen()), (e) => false);
            },
            icon: const Icon(Icons.logout_rounded, color: Colors.red,))
      ],
    );
  }
}
