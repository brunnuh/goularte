import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/options_controller.dart';
import 'package:goularte/views/globals/alert_widget.dart';
import 'package:goularte/views/options/components/switch_button.dart';
import 'package:line_icons/line_icons.dart';

class OptionsView extends StatelessWidget {
  OptionsController optionsController = GetIt.I<OptionsController>();

  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Theme.of(context).appBarTheme.color),
        actions: [
          IconButton(
            icon: Icon(
              LineIcons.exclamationCircle,
              color: Colors.amber,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertWidget(
                    content:
                        "Caso não tenha desativado as notificações, reiniciar o aplicativo para salvar",
                    icon: Icon(
                      LineIcons.exclamationCircle,
                      color: Colors.amber,
                      size: 30,
                    ),
                    actions: null,
                  );
                },
              );
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (_) {
                return SwitchButton(
                  name: "Notificações",
                  active: optionsController.changeNotification != null
                      ? optionsController.changeNotification
                      : true,
                  lineIcons: LineIcons.bell,
                  onChanged: optionsController.setChangeNotification,
                  textStyle: textStyle,
                );
              },
            ),
            SwitchButton(
              name: "Modo Dark",
              active: false, //optionsController.changeNotification,
              lineIcons: LineIcons.moon,
              onChanged: null,
              textStyle: textStyle,
            )
          ],
        ),
      ),
    );
  }
}
