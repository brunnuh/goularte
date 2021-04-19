import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/ideas_controller.dart';

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
            IconButton(
              icon: Icon(
                Icons.update,
                size: 27,
              ),
              onPressed: () async {
                await ideasController.getAllIdeas();
              },
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Observer(builder: (_) {
          print(ideasController.topIdeas);
          if (!ideasController.loadingTop) {
            if (ideasController.topIdeas.isEmpty ||
                ideasController.topIdeas == null) {
              return Center(
                child: Text(
                  "Ainda não há top Ideias.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
              );
            } else {
              return Container(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CardIdeas(
                      position: 1,
                      description: ideasController.topIdeas[0].description,
                      user: ideasController.topIdeas[0].user,
                    ),
                    CardIdeas(
                      position: 2,
                      description: ideasController.topIdeas[1].description,
                      user: ideasController.topIdeas[1].user,
                    ),
                    CardIdeas(
                      position: 3,
                      description: ideasController.topIdeas[1].description,
                      user: ideasController.topIdeas[1].user,
                    ),
                  ],
                ),
              );
            }
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
