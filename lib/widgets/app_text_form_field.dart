import 'package:flutter/material.dart';


class AppTextFormField extends StatelessWidget {
  final String? hintText;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool? readOnly;
  final void Function()? onTap;
  final String? Function(String?)? validator;

  const AppTextFormField({super.key, this.hintText, this.maxLines, this.suffixIcon, this.readOnly, this.onTap, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onTap: onTap,
      maxLines: maxLines,
      readOnly: readOnly ?? false,
      validator:validator?? (value){
        if(value==null||value.isEmpty){
          return "Field is required";
        }
      },
      onTapOutside: (value){
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        hintText:hintText ,
        suffixIcon: suffixIcon,

border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple)
        ),


      ),
    );
  }
}
