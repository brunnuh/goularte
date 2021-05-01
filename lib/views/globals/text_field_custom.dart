import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final Function onChanged;
  final String erroText;

  TextFieldCustom(
      {this.labelText, this.keyboardType, this.onChanged, this.erroText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Theme.of(context).appBarTheme.color,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: this.labelText,
        errorText: erroText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        isDense: true,
      ),
      keyboardType: this.keyboardType,
    );
  }
}
