import 'package:flutter/material.dart';
import 'package:goularte/views/art/art_view.dart';
import 'package:goularte/views/ideas/ideas_view.dart';

class BaseView extends StatelessWidget {
  PageController pageController = PageController(initialPage: 2);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
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
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: Colors.amber,
          ),
        )
      ],
    );
  }
}
