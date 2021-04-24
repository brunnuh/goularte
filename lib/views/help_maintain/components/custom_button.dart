import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  VoidCallback onTap;
  String fieldText;
  IconData iconData;

  CustomButton({this.onTap, this.fieldText, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          colors: [
            //Colors.redAccent,
            Colors.blue.shade500,
            Colors.purple,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            offset: Offset(.0, 1.0), //(x,y)
            blurRadius: 1.0,
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(
          fieldText,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
    );
  }
}
