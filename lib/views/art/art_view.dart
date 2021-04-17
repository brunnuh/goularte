import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:goularte/controllers/art_controller.dart';
import 'package:goularte/views/art/components/art_block.dart';

class ArtView extends StatefulWidget {
  @override
  _ArtViewState createState() => _ArtViewState();
}

class _ArtViewState extends State<ArtView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    artController.getArts();
  }

  ArtController artController = ArtController();

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
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 180,
                      childAspectRatio: 3 / 5,
                      //crossAxisSpacing: 1,
                    ),
                    itemCount: artController.arts.length,
                    itemBuilder: (_, index) {
                      return ArtBlock(artController.arts[index]);
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
