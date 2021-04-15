import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:goularte/models/art.dart';
import 'package:goularte/views/art/components/art_full.dart';

class ArtBlock extends StatelessWidget {
  final Art art;

  ArtBlock(this.art);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /*showDialog(
          context: context,
          builder: (_) {
            return ArtFull(art);
          },
        );*/
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ArtFull(art)));
      },
      child: Card(
        shape: Border.all(
          color: Theme.of(context).appBarTheme.color ?? Colors.redAccent,
          width: 1.3,
        ),
        child: Hero(
          tag: art.image.url.toString(),
          child: CachedNetworkImage(
            imageUrl: art.image.url,
            fit: BoxFit.cover,
            //alignment: Alignment.centerRight,
          ),
        ),
      ),
    );
  }
}
