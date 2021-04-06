import 'package:flutter/material.dart';
import 'package:goularte/views/art/art_view.dart';
import 'package:goularte/views/base/components/bottom_bar.dart';
import 'package:goularte/views/ideas/ideas_view.dart';

class BaseView extends StatelessWidget {
  PageController pageController = PageController(initialPage: 2);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: pageController,
          //physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              color: Colors.orange,
            ),
            IdeasView(),
            ArtView(),
          ],
        ),
        Positioned(
          bottom: 0,
          child: BottomBar(),
        )
      ],
    );
  }
}
