import 'package:flutter/material.dart';
import 'package:goularte/helpers/extensions.dart';
import 'package:goularte/repositories/ideas_repository.dart';
import 'package:line_icons/line_icons.dart';

class FieldIdeasCard extends StatelessWidget {
  final String name;
  final String urlImage;
  final DateTime createdAt;
  final String description;
  final int likes;

  FieldIdeasCard({
    @required this.name,
    @required this.description,
    @required this.likes,
    @required this.createdAt,
    @required this.urlImage,
  });

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
                      Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: Text(
                          description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        createdAt.formattedDate(),
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
              GestureDetector(
                onTap: () async {
                  await IdeasRepository().getAllIdeas();
                },
                child: Row(
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
