import 'package:flutter/material.dart';
import 'package:goularte/helpers/extensions.dart';
import 'package:goularte/models/ideas.dart';

class FieldIdeasCard extends StatelessWidget {
  final Ideas ideas;
  final VoidCallback openIdea;

  FieldIdeasCard({
    @required this.ideas,
    @required this.openIdea,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openIdea,
      child: Container(
        height: 110,
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Hero(
                  tag: ideas.objectId,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                      ideas.user.photo,
                    ),
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
                          ideas.user.name,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 3),
                          child: Text(
                            ideas.description,
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
                          ideas.createdAt.formattedDate(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
