import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArtFull extends StatelessWidget {
  final String image;
  ArtFull({@required this.image});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'image',
      child: Scaffold(
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
          child: Card(
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
