import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/ideas_controller.dart';
import 'package:goularte/controllers/login_controller.dart';
import 'package:goularte/controllers/parse_controller.dart';
import 'package:goularte/views/globals/alert_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';

class TopInformation extends StatelessWidget {
  LoginController loginController = GetIt.I<LoginController>();
  ParseController parseController = GetIt.I<ParseController>();
  IdeasController ideasController = GetIt.I<IdeasController>();

  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: GestureDetector(
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) {
                  return AlertWidget(
                    content: loginController.user.photo == null
                        ? "Adicionar uma foto de perfil?"
                        : "Substituir foto de perfil?",
                    icon: Icon(
                      LineIcons.question,
                      size: 50,
                      color: Colors.green,
                    ),
                    actions: [
                      FlatButton(
                        onPressed: () async {
                          var getPhoto = await imagePicker.getImage(
                              source: ImageSource.gallery);
                          Navigator.of(context).pop();
                          if (getPhoto != null) {
                            File photo = File(getPhoto.path);
                            await parseController.uploadPhoto(photo);
                            await ideasController.getTopIdeas();
                            await ideasController.getAllIdeas();
                          }
                        },
                        child: Text('Sim'),
                      ),
                      FlatButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Cancelar'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Observer(
              builder: (_) {
                return ClipOval(
                  child: loginController.user.photo == null
                      ? Image.asset(
                          'assets/sem-imagem-avatar.png',
                          fit: BoxFit.contain,
                          width: 120,
                        )
                      : CachedNetworkImage(
                          imageUrl: loginController.user.photo,
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Observer(builder: (_) {
          if (loginController.user != null &&
              loginController.user.name != null &&
              loginController.user.email != null) {
            return Column(
              children: [
                Text(
                  loginController.user.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                  ),
                ),
                Text(
                  loginController.user.email,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        })
      ],
    );
  }
}
