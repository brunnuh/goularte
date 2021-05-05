import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/ideas_controller.dart';
import 'package:goularte/views/ideas/ideas_details.dart';

import 'card_ideas.dart';

class TopIdeas extends StatelessWidget {
  IdeasController ideasController = GetIt.I<IdeasController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Ideias',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            /*IconButton(
              icon: Icon(
                Icons.update,
                size: 27,
              ),
              onPressed: () async {
                //await ideasController.getAllIdeas();
               //await ideasController.getNextPage();
              },
            )*/

            /// desabilitado para não ultrapassar o limite do parse
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Observer(builder: (_) {
          if (!ideasController.loadingTop) {
            if (ideasController.topIdeas.isEmpty ||
                ideasController.topIdeas == null ||
                ideasController.topIdeas.length < 3) {
              return Center(
                child: Text(
                  "Ainda não há top Ideias.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
              );
            } else if (ideasController.topIdeas.length == 3) {
              return Container(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      child: CardIdeas(
                        position: 1,
                        description: ideasController.topIdeas[0].description,
                        user: ideasController.topIdeas[0].user,
                        assetImage: "assets/medal-gold.png",
                      ),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              IdeasDetails(idea: ideasController.topIdeas[0]),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: CardIdeas(
                        position: 2,
                        description: ideasController.topIdeas[1].description,
                        user: ideasController.topIdeas[1].user,
                        assetImage: "assets/medal-silver.png",
                      ),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              IdeasDetails(idea: ideasController.topIdeas[1]),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: CardIdeas(
                        position: 3,
                        description: ideasController.topIdeas[2].description,
                        user: ideasController.topIdeas[2].user,
                        assetImage: "assets/medal-bronze.png",
                      ),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              IdeasDetails(idea: ideasController.topIdeas[2]),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          } else {
            return LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).appBarTheme.color,
              ),
              backgroundColor: Colors.white,
            );
          }
        })
      ],
    );
  }
}
