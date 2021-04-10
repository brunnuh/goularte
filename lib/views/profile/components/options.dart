import 'package:flutter/material.dart';
import 'package:goularte/controllers/login_controller.dart';
import 'package:goularte/repositories/user_repository.dart';
import 'package:goularte/views/login/login_view.dart';
import 'package:line_icons/line_icons.dart';

class Options extends StatelessWidget {
  LoginController loginController;

  Options({this.loginController});

  @override
  Widget build(BuildContext context) {
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
                  onTap: () {},
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
                    await UserRepository().logout();
                    loginController.clearFields();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => LoginView()),
                        (route) => false);
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
  }
}
