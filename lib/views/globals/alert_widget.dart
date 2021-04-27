import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  final String content;
  final Widget icon;
  final List<Widget> actions;

  AlertWidget({
    @required this.content,
    @required this.icon,
    @required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      title: icon,
      actions: actions,
    );
  }
}
