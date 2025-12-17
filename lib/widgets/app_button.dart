import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const AppButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          minimumSize: Size(double.infinity, 70),
          elevation: 15,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          ),
        ),
        onPressed:onPressed, child:Text(title,
      style: TextStyle(
          color: Colors.white,fontSize: 20,
          fontWeight: FontWeight.w700

      ),
    ) );
  }
}
