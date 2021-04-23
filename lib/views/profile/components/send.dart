import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/art_controller.dart';
import 'package:image_picker/image_picker.dart';

class Send extends StatelessWidget {
  ArtController artController = GetIt.I<ArtController>();

  Widget alert(String text, BuildContext context) {
    return AlertDialog(
      title: Wrap(
        children: [
          Text(
            text,
            style: TextStyle(),
          )
        ],
      ),
      actions: [
        FlatButton(
          onPressed: () {
            artController.setNullInErro();
            Navigator.of(context).pop();
          },
          child: Text("Ok"),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return WillPopScope(
          onWillPop: () async => artController.loadingSave ? false : true,
          child: Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  iconTheme:
                      IconThemeData(color: Theme.of(context).appBarTheme.color),
                ),
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              PickedFile fileImage = await ImagePicker()
                                  .getImage(source: ImageSource.gallery);

                              if (fileImage != null) {
                                final file = File(fileImage.path);
                                await artController.saveArt(file);

                                if (artController.erro != null) {
                                  return showDialog(
                                    context: context,
                                    builder: (_) {
                                      return alert(artController.erro, context);
                                    },
                                  );
                                }
                              } else {
                                return showDialog(
                                  context: context,
                                  builder: (_) {
                                    return alert(
                                        'Imagem enviada.\nAguarde ela ser analizada.',
                                        context);
                                  },
                                );
                              }
                            },
                            child: ListTile(
                              title: Text("Arte"),
                              subtitle: Text(
                                "Compartilhe seus desenhos favoritos ou artes que você fez.",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(
                              color: Colors.black87,
                            ),
                          ),
                          ListTile(
                            title: Text("Ideias"),
                            subtitle: Text(
                              "Compartilhe suas ideias para video, quem sabe o Gou não veja.",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              artController.loadingSave
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black87,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                                Theme.of(context).appBarTheme.color),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Enviando",
                            style: TextStyle(inherit: false),
                          )
                        ],
                      ),
                    )
                  : Container()
            ],
          ),
        );
      },
    );
  }
}
