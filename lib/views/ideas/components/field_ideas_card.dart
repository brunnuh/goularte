import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class FieldIdeasCard extends StatelessWidget {
  final String name = 'Roberta Silva';
  final String urlImage =
      'https://pm1.narvii.com/6603/09dadef8df7a3417608a2b00599e1df2b078fc60_hq.jpg';
  final String createdAt = '30/02/2020 20:30';
  final String description =
      'tesasa sasd asdas dasdasdsadasd asndnasdnqwnd wqn wnq qwdqwqd qwdqwdqw dqwd qdqw wqddwqdqwd qwdqwd qwdqw';
  final int likes = 12;

  //FieldIdeasCard({@required this.name, @required this.urlImage, @required this.createdAt, @required this.likes});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                  urlImage,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        createdAt,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 1),
                      child: Text(
                        likes.toString(),
                      )),
                  Icon(
                    LineIcons.thumbsUp,
                    size: 24,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
