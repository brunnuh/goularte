import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  final IconData icon;
  final double size;

  CardButton({this.icon = Icons.scanner_sharp, this.size = 25});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height,
      child: Card(
        elevation: 0,
        child: IconButton(
          icon: Icon(
            icon,
            color: Theme.of(context).appBarTheme.color,
            size: size,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
