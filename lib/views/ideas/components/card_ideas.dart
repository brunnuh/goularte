import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:goularte/models/user.dart';
import 'package:line_icons/line_icons.dart';

class CardIdeas extends StatelessWidget {
  final String description;
  final User user;
  final int position;

  CardIdeas({@required this.position, @required this.description, this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        //color: Color(0xffD55759),
        color: Colors.purple.shade300,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 80,
                        clipBehavior: Clip.antiAlias,
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60)),
                        margin: EdgeInsets.only(bottom: 1, top: 16),
                        child: CachedNetworkImage(
                          imageUrl: user.photo,
                        ),
                      ),
                      Positioned(
                        top: -4,
                        right: 14,
                        child: Icon(
                          LineIcons.crown,
                          size: 40,
                          color: position == 1
                              ? Colors.orangeAccent
                              : position == 2
                                  ? Color(0xffDBDAD8)
                                  : Color(0xff99675E),
                        ),
                      )
                    ],
                  ),
                  Text(
                    user.name,
                    style: GoogleFonts.lobster(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(17, 10, 10, 10),
                  child: Text(
                    description,
                    maxLines: 5,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lobster(
                      fontWeight: FontWeight.w100,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
