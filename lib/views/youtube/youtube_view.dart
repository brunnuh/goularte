import 'package:flutter/material.dart';
import 'package:goularte/views/youtube/components/youtube_card.dart';

class YoutubeView extends StatelessWidget {
  final List searchList;

  YoutubeView({@required this.searchList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: searchList.length,
        itemBuilder: (_, index) {
          return Container(
            //height: 140,
            margin: index == searchList.length - 1
                ? EdgeInsets.only(bottom: 70)
                : null,
            child: YoutubeCard(youtubeItem: searchList[index]),
          );
        },
      ),
    );
  }
}
