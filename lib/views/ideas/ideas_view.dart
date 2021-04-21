import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/ideas_controller.dart';
import 'package:goularte/models/ideas.dart';
import 'package:goularte/views/ideas/ideas_details.dart';

import 'components/field_ideas_card.dart';
import 'components/top_ideas.dart';

class IdeasView extends StatelessWidget {
  ScrollController controller = ScrollController();

  IdeasController ideasController = GetIt.I<IdeasController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: ListView(
          physics: ScrollPhysics(),
          children: [
            TopIdeas(),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Outras Ideias ...',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Observer(
              builder: (context) {
                if (!ideasController.loadingAll) {
                  if (ideasController.ideasList == null ||
                      ideasController.ideasList.isEmpty) {
                    return Center(
                      child: Text(""),
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: ideasController.ideasList.length,
                      itemBuilder: (_, index) {
                        Ideas idea = ideasController.ideasList[index];
                        return FieldIdeasCard(
                          ideas: idea,
                          openIdea: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => IdeasDetails(idea: idea))),
                        );
                      },
                    );
                  }
                } else {
                  return Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.4),
                    child: Center(
                        child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).appBarTheme.color,
                      ),
                      backgroundColor: Colors.white,
                    )),
                  );
                }
              },
            ),
            const SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}
