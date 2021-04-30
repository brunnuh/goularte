import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/ideas_controller.dart';
import 'package:goularte/models/ideas.dart';

import 'field_ideas_card.dart';

class ListIdeas extends StatelessWidget {
  IdeasController ideasController = GetIt.I<IdeasController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: ideasController.countListIdeas,
        itemBuilder: (_, index) {
          if (ideasController.ideasList.length > index) {
            Ideas idea = ideasController.ideasList[index];
            return FieldIdeasCard(ideas: idea);
          } else if (!ideasController.lastPage) {
            return Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 165, vertical: 10),
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      );
    });
  }
}
