import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:goularte/controllers/art_controller.dart';
import 'package:goularte/models/art.dart';
import 'package:permission_handler/permission_handler.dart';

class ArtFull extends StatelessWidget {
  final Art art;
  ArtFull(this.art);

  ArtController artController = ArtController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.file_download),
            onPressed: () async {
              final status = await Permission.storage.request();

              if (status.isGranted) {
                await artController.downloadArt(art.image.url, art.image.name);
              }
            },
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
          child: Observer(
            builder: (_) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Card(
                    child: CachedNetworkImage(
                      imageUrl: art.image.url,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  artController.loading
                      ? Container(
                          color: Colors.black87,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Center(
                              child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                                Theme.of(context).appBarTheme.color),
                          )),
                        )
                      : Container()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
