import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class CardIdeas extends StatelessWidget {
  final String description =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  final int position;

  CardIdeas({@required this.position});

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
                        height: 90,
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.only(bottom: 10),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                            'https://pm1.narvii.com/6603/09dadef8df7a3417608a2b00599e1df2b078fc60_hq.jpg',
                          ),
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
                    'Roberta Silva',
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
