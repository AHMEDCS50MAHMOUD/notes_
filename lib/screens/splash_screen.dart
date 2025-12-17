import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes/screens/auth_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   nextScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Lottie.asset("assets/images/splash_icon.json"),
           Text("Notes",style: TextStyle(
             fontSize: 30,
             fontWeight: FontWeight.w700,

           ),),
           SizedBox(height: 15,),
           Text("It's Time To Go Organized",style: TextStyle(
             fontSize: 20,
             fontWeight:FontWeight.w400,
             color: Colors.grey
           ),)
         ],
       ),
     ),
    );
  }
  void nextScreen(){
Future.delayed(Duration(seconds:5),(){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AuthScreen()));
});

  }
}
