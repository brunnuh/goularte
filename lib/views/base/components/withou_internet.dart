import 'package:flutter/material.dart';

class WithoutInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/sem-internet.png",
            height: 200,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Oops, Sem conexão com a internet",
            style: TextStyle(
              inherit: false,
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Por favor, verifique sua conexão.",
            style: TextStyle(
              inherit: false,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
