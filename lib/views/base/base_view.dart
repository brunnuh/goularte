import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:goularte/controllers/youtube_controller.dart';
import 'package:goularte/views/art/art_view.dart';
import 'package:goularte/views/base/components/bottom_bar.dart';
import 'package:goularte/views/ideas/ideas_view.dart';
import 'package:goularte/views/youtube/youtube_view.dart';

class BaseView extends StatelessWidget {
  PageController pageController = PageController(initialPage: 0);
  final YoutubeController youtubeController = YoutubeController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: pageController,
          //physics: NeverScrollableScrollPhysics(),
          children: [
            Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(top: 20),
                child: Observer(
                  builder: (_) {
                    return youtubeController.ytVideos.isEmpty
                        ? Center(child: CircularProgressIndicator())
                        : YoutubeView(searchList: youtubeController.ytVideos);
                  },
                ),
              ),
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
