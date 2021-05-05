import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:goularte/controllers/art_controller.dart';
import 'package:goularte/models/art.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

class ArtFull extends StatelessWidget {
  ArtController artController = ArtController();
  final Art art;
  ArtFull(this.art) {
    artController.setExist(art.image.name);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            actions: [
              IconButton(
                icon: Icon(Icons.file_download),
                onPressed: () async {
                  final status = await Permission.storage.request();

                  if (status.isGranted) {
                    await artController.downloadArt(
                        art.image.url, art.image.name);
                  }
                },
              ),
              Observer(builder: (_) {
                return artController.exist
                    ? IconButton(
                        icon: Icon(
                          Icons.panorama,
                        ),
                        onPressed: () async {
                          artController.setLoading(true);
                          final int location = WallpaperManager.BOTH_SCREENS;
                          var directory = await getExternalStorageDirectory();
                          String path = directory.path + "/" + art.image.name;
                          if (artController.exist) {
                            await WallpaperManager.setWallpaperFromFile(
                                path, location);
                            await Future.delayed(Duration(seconds: 1));
                          }

                          artController.setLoading(false);
                        },
                      )
                    : Container();
              })
            ],
          ),
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Enviado por ${art.user.name}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Hero(
                  tag: art.image.url.toString(),
                  child: Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent,
                    child: CachedNetworkImage(
                      imageUrl: art.image.url,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
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
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
