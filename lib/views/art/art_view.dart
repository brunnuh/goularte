import 'package:flutter/material.dart';
import 'package:goularte/views/art/components/art_block.dart';

class ArtView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Artes',
          style: TextStyle(
            color: Theme.of(context).appBarTheme.color,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 50),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisExtent: 180,
            mainAxisSpacing: 10,
          ),
          itemCount: 5,
          itemBuilder: (_, __) {
            return ArtBlock();
          },
        ),
      ),
    );
  }
}
