import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:goularte/views/art/components/art_full.dart';

class ArtBlock extends StatelessWidget {
  final String image =
      'https://i.pinimg.com/originals/e7/3f/78/e73f78b35b21dbbecfbf30d2f0841e8b.jpg';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) {
            return ArtFull(
              image: image,
            );
          },
        );
      },
      child: Card(
        shape: Border.all(
          color: Theme.of(context).appBarTheme.color ?? Colors.redAccent,
          width: 3,
        ),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
