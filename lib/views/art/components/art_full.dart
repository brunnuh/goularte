import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:goularte/models/art.dart';

class ArtFull extends StatelessWidget {
  final Art art;
  ArtFull(this.art);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.file_download),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.panorama),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        child: Hero(
          tag: art.image.url.toString(),
          child: Card(
            child: CachedNetworkImage(
              imageUrl: art.image.url,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
