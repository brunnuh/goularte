import 'package:flutter/material.dart';
import 'package:goularte/views/base/components/card_button.dart';
import 'package:line_icons/line_icons.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CardButton(
            icon: LineIcons.youtube,
            size: 30,
            page: 0,
          ),
          CardButton(
            icon: LineIcons.comments,
            size: 30,
            page: 1,
          ),
          CardButton(
            icon: LineIcons.photoVideo,
            size: 30,
            page: 2,
          ),
          CardButton(
            icon: LineIcons.user,
            size: 30,
            page: 3,
          ),
        ],
      ),
    );
  }
}
