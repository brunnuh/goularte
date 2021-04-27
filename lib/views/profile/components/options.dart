import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/info_app_controller.dart';
import 'package:goularte/controllers/login_controller.dart';
import 'package:goularte/repositories/user_repository.dart';
import 'package:goularte/views/globals/alert_widget.dart';
import 'package:goularte/views/help_maintain/help_maintain_view.dart';
import 'package:goularte/views/options/options_view.dart';
import 'package:goularte/views/profile/components/send.dart';
import 'package:line_icons/line_icons.dart';

class Options extends StatelessWidget {
  final LoginController loginController = GetIt.I<LoginController>();

  InfoAppController _infoAppController = GetIt.I<InfoAppController>();

  TextStyle textStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  Widget buttonCard(
      String text, BuildContext context, icon, VoidCallback onPressed) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: ListTile(
          leading: Icon(
            icon,
            color: Theme.of(context).appBarTheme.color,
          ),
          title: Text(
            text,
            style: textStyle,
          ),
          trailing: Icon(
            LineIcons.arrowRight,
            color: Theme.of(context).appBarTheme.color,
          ),
        ),
      ),
    );
  }

  alertLogout(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertWidget(
            content: "Quer concluir essa ação?",
            icon: Icon(
              LineIcons.question,
              size: 50,
              color: Colors.redAccent,
            ),
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
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          loginController.user == null
              ? Container()
              : buttonCard(
                  "Enviar",
                  context,
                  LineIcons.upload,
                  () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (_) => Send(),
                      ),
                    );
                  },
                ),
          buttonCard(
            "Opções",
            context,
            LineIcons.tools,
            () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (_) => OptionsView(),
                ),
              );
            },
          ),
          buttonCard(
            "Ajude a manter",
            context,
            LineIcons.smilingFace,
            () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (_) => HelpMaintainView(),
                ),
              );
            },
          ),
          loginController.user == null
              ? Container()
              : buttonCard(
                  "Log out",
                  context,
                  Icons.logout,
                  () async {
                    return alertLogout(context);
                  },
                ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Observer(
            builder: (_) => Text(
              "versão ${_infoAppController.packageInfo.version}",
              style: TextStyle(
                color: Theme.of(context).appBarTheme.color,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      );
    });
  }
}
