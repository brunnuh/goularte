import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/art_controller.dart';
import 'package:goularte/controllers/base_controller.dart';
import 'package:goularte/controllers/youtube_controller.dart';
import 'package:goularte/views/art/art_view.dart';
import 'package:goularte/views/base/components/bottom_bar.dart';
import 'package:goularte/views/ideas/ideas_view.dart';
import 'package:goularte/views/profile/profile_view.dart';
import 'package:goularte/views/youtube/youtube_view.dart';
import 'package:mobx/mobx.dart';

class BaseView extends StatefulWidget {
  int page;
  BaseView({this.page = 1});
  @override
  _BaseViewState createState() => _BaseViewState(page: page);
}

class _BaseViewState extends State<BaseView> {
  int page;
  _BaseViewState({this.page = 1})
      : pageController = PageController(initialPage: page);

  final BaseController baseController = GetIt.I<BaseController>();
  ArtController artController = GetIt.I<ArtController>();

  PageController pageController;

  final YoutubeController youtubeController = YoutubeController();
  @override
  void initState() {
    super.initState();
    reaction(
      (_) => baseController.page,
      (int page) {
        pageController.jumpToPage(page);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
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
            Observer(
              builder: (_) {
                return Stack(
                  children: [
                    ProfileView(),
                    artController.loadingSave
                        ? Container(
                            color: Colors.black87,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Container()
                  ],
                );
              },
            )
          ],
        ),
        Observer(
          builder: (_) {
            if (artController.loadingSave) {
              return Container();
            } else {
              return Positioned(
                bottom: 0,
                child: BottomBar(),
              );
            }
          },
        )
      ],
    );
  }
}
