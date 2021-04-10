import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  final String message;

  ErrorBox(this.message);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Card(
        color: Colors.redAccent,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            message,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
