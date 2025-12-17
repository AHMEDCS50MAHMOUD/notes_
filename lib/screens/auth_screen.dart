import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes/services/validator_servic.dart';
import 'package:notes/widgets/app_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? photo;
  final GlobalKey <FormState> _formKey=GlobalKey();
  void pickImageFromCamera() async {
    photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  void pickImageFromGallery() async {
    photo = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: photo == null,
              replacement: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.black,
                backgroundImage: Image.file(File(photo?.path ?? "")).image,
              ),
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.black,
                child: Icon(Icons.person, size: 170, color: Colors.deepPurple),
              ),
            ),
            SizedBox(height: 20),
            AppButton(
              title: "Take a Picture From Camera ",
              onPressed: () {
                pickImageFromCamera();
              },
            ),
            SizedBox(height: 20),
            AppButton(
              title: "Take a picture From Gallery",
              onPressed: () {
                pickImageFromGallery();
              },
            ),
            SizedBox(height: 20),
            Divider(thickness: 2, color: Colors.deepPurple),
            SizedBox(height: 20),
            Form(
              key:_formKey,
              child: TextFormField(
                onTapUpOutside: (value){
                  FocusScope.of(context).unfocus();
                },

              validator:ValidatorService.nameValidator ,

              decoration: InputDecoration(
                labelText: "Your Name",
                enabled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),),
            ElevatedButton(onPressed: (){
              _formKey.currentState?.validate();
            }, child: Text("Done",style:
              TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,

              ),
            ))
          ],
        ),
      ),
    );
  }
}
