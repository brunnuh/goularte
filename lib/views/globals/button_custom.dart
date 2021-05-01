import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final String labelTitle;
  final Function onPressed;
  final bool loading;
  final bool pressedButton;

  ButtonCustom(
      {this.labelTitle, this.onPressed, this.loading, this.pressedButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        child: loading
            ? SizedBox(
                width: 23,
                height: 23,
                child: CircularProgressIndicator(
                  strokeWidth: 4,
                  valueColor: AlwaysStoppedAnimation(
                      Theme.of(context).appBarTheme.color),
                ),
              )
            : Text(
                labelTitle,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            pressedButton ? Theme.of(context).appBarTheme.color : Colors.grey,
          ),
        ),
      ),
    );
  }
}
