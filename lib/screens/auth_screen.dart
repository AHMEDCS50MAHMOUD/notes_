import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes/models/user_model.dart';
import 'package:notes/screens/home_screen.dart';
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
TextEditingController nameController=TextEditingController();
  addUser()async{
    var myBox=Hive.box<UserModel>("user");
    await myBox.clear();

    myBox.add(UserModel(image: photo?.path??"",
        name: nameController.text)).then((v){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (v)=>HomeScreen()), (e)=>false) ;
    }).catchError((e){

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: photo == null,
                  replacement: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.black,
                    backgroundImage: Image.file(File(photo?.path ??"")).image,
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
                    controller:nameController ,
                    onTapUpOutside: (value){
                      FocusScope.of(context).unfocus();
                    },

                  validator:ValidatorService.nameValidator ,

                  decoration: InputDecoration(
                    labelText: "Your Name",
                    enabled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(12)

                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                        borderRadius: BorderRadius.circular(12)
                    ),
                  ),
                ),),
                SizedBox(height: 20),
                AppButton(
                  title: "Confirm",
                  onPressed: () {
                    if(photo==null){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title:Center(child: Icon(Icons.error_outline,color: Colors.red,size: 50,)),
                         content:  Text("Please Select Image",textAlign: TextAlign.center,),);

                      });
                      return;
                    }
                    addUser();




                  },
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
