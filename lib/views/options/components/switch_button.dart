import 'package:flutter/material.dart';

class SwitchButton extends StatelessWidget {
  IconData lineIcons;
  String name;
  bool active;
  Function onChanged;
  TextStyle textStyle;

  SwitchButton({
    @required this.lineIcons,
    @required this.onChanged,
    @required this.active,
    @required this.name,
    @required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing: Switch(
          value: active,
          onChanged: onChanged,
          activeColor: Colors.green,
        ),
        title: Text(
          name,
          style: textStyle,
        ),
        leading: Icon(
          lineIcons,
          color: Theme.of(context).appBarTheme.color,
        ),
      ),
    );
  }
}
