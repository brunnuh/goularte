import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:goularte/models/user.dart';

class CardIdeas extends StatelessWidget {
  final String description;
  final User user;
  final int position;
  final String assetImage;

  CardIdeas(
      {@required this.position,
      @required this.description,
      this.user,
      @required this.assetImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        color: Color(0xff7f2982),
        //color: Theme.of(context).appBarTheme.color,
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
                        width: 80,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(100)),
                        margin: EdgeInsets.only(bottom: 1, top: 16),
                        child: CachedNetworkImage(
                          imageUrl: user.photo,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 20,
                        child: Image.asset(
                          this.assetImage,
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    user.name,
                    style: GoogleFonts.abrilFatface(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      color: Color(0xffedf2f4),
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
                    style: GoogleFonts.abrilFatface(
                      fontWeight: FontWeight.w200,
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
