import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/ideas_controller.dart';

import 'components/list_ideas.dart';
import 'components/top_ideas.dart';

class IdeasView extends StatefulWidget {
  @override
  _IdeasViewState createState() => _IdeasViewState();
}

class _IdeasViewState extends State<IdeasView> {
  ScrollController controller = ScrollController();

  IdeasController ideasController = GetIt.I<IdeasController>();

  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
  }

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange &&
        !ideasController.lastPage &&
        !ideasController.loadingAll) {
      ideasController.nextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: ListView(
          physics: ScrollPhysics(),
          controller: scrollController,
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
            ideasController.ideasList.length > 0
                ? ListIdeas()
                : Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 30),
                    child: Text(
                      "Ainda não há ideias",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    ),
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
