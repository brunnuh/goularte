import 'package:flutter/material.dart';
import 'package:goularte/views/login/login_view.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            'assets/sem-imagem-avatar.png',
            fit: BoxFit.contain,
            width: 120,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => LoginView())),
          child: Text(
            "Para enviar artes e ideias faça login",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
