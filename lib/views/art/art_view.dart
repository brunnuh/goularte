import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/art_controller.dart';
import 'package:goularte/views/art/components/art_block.dart';

class ArtView extends StatefulWidget {
  @override
  _ArtViewState createState() => _ArtViewState();
}

class _ArtViewState extends State<ArtView> {
  ScrollController scrollController;
  ArtController artController = GetIt.I<ArtController>();

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(artListener);
    super.initState();
    //artController.getArts();
    // pega as artes toda vez que é chamado, mas foi desativado pois o servidor vai cobrar caso aja muitas requisicoes
  }

  artListener() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange &&
        !artController.lastArt) {
      artController.nextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                'Artes',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Observer(
                builder: (_) {
                  return GridView.builder(
                    controller: scrollController,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 180,
                      childAspectRatio: 3 / 5,
                      //crossAxisSpacing: 1,
                    ),
                    itemCount: artController.arts.length,
                    itemBuilder: (_, index) {
                      if (artController.arts.length > index) {
                        return ArtBlock(artController.arts[index]);
                      }

                      return Container();
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
