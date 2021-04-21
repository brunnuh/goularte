import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/art_controller.dart';
import 'package:goularte/controllers/login_controller.dart';
import 'package:goularte/repositories/user_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';

class Options extends StatelessWidget {
  final LoginController loginController = GetIt.I<LoginController>();

  ArtController artController = GetIt.I<ArtController>();

  //Options({this.loginController});

  @override
  Widget build(BuildContext context) {
    print(loginController.user);
    return Observer(builder: (_) {
      return Column(
        children: [
          loginController.user == null
              ? Container()
              : Card(
                  child: InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text(
                        'Enviar ideia',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      leading: Icon(
                        LineIcons.upload,
                        color: Theme.of(context).appBarTheme.color,
                      ),
                      trailing: Icon(
                        LineIcons.arrowRight,
                        color: Theme.of(context).appBarTheme.color,
                      ),
                    ),
                  ),
                ),
          loginController.user == null
              ? Container()
              : Card(
                  child: InkWell(
                    onTap: () async {
                      PickedFile fileImage = await ImagePicker()
                          .getImage(source: ImageSource.gallery);

                      if (fileImage != null) {
                        final file = File(fileImage.path);
                        await artController.saveArt(file);
                      }
                      if (artController.erro != null) {
                        return showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Wrap(
                                children: [
                                  Text(
                                    artController.erro,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              actions: [
                                FlatButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text("Ok"),
                                )
                              ],
                            );
                          },
                        );
                      } else {
                        return showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  Text(
                                    'Imagem enviada.\nAguarde ela ser analizada.',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
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
                          },
                        );
                      }
                    },
                    child: ListTile(
                      title: Text(
                        'Enviar arte',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      leading: Icon(
                        LineIcons.alternateCloudUpload,
                        color: Theme.of(context).appBarTheme.color,
                      ),
                      trailing: Icon(
                        LineIcons.arrowRight,
                        color: Theme.of(context).appBarTheme.color,
                      ),
                    ),
                  ),
                ),
          Card(
            child: InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Notificações',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: Icon(
                  LineIcons.bell,
                  color: Theme.of(context).appBarTheme.color,
                ),
                trailing: Icon(
                  LineIcons.arrowRight,
                  color: Theme.of(context).appBarTheme.color,
                ),
              ),
            ),
          ),
          loginController.user == null
              ? Container()
              : Card(
                  child: InkWell(
                    onTap: () async {
                      return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Quer concluir essa ação?"),
                              actions: [
                                FlatButton(
                                  onPressed: () async {
                                    await UserRepository().logout();
                                    loginController.clearFields();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Sim"),
                                ),
                                FlatButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text("Não"),
                                )
                              ],
                            );
                          });
                    },
                    child: ListTile(
                      title: Text(
                        'Log out',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      leading: Icon(
                        Icons.logout,
                        color: Theme.of(context).appBarTheme.color,
                      ),
                      trailing: Icon(
                        LineIcons.arrowRight,
                        color: Theme.of(context).appBarTheme.color,
                      ),
                    ),
                  ),
                )
        ],
      );
    });
  }
}
