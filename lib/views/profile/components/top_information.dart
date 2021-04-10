import 'package:flutter/material.dart';
import 'package:goularte/controllers/login_controller.dart';

class TopInformation extends StatelessWidget {
  LoginController loginController;

  TopInformation(this.loginController);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: ClipOval(
            child: Image.asset(
              'assets/image1.jpg',
              fit: BoxFit.contain,
              width: 120,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          loginController.user.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 24,
          ),
        ),
        Text(
          loginController.user.email,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
