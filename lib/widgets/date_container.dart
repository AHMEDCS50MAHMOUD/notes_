import 'package:flutter/material.dart';

class DateContainer extends StatelessWidget {

  final bool isActive;
final String statusText;
final void Function()? onTap;
  const DateContainer({
    super.key,

    this.isActive = false, required this.statusText, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
        
          padding: const EdgeInsets.symmetric( vertical: 12),
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: isActive ? Colors.deepPurple : Colors.grey,
            borderRadius: BorderRadius.circular(15),
          ),
          child:Center(child: Text(statusText)) ,
        ),
      ),
    );
  }
}
