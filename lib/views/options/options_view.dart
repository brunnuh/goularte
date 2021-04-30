import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:goularte/controllers/options_controller.dart';
import 'package:goularte/views/options/components/switch_button.dart';
import 'package:line_icons/line_icons.dart';

class OptionsView extends StatelessWidget {
  OptionsController optionsController = OptionsController();

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
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (_) {
                return SwitchButton(
                  name: "Notificações do Youtube",
                  active: optionsController.changeNotificationYoutube,
                  lineIcons: LineIcons.youtube,
                  onChanged: optionsController.setChangeNotificationYoutube,
                  textStyle: textStyle,
                );
              },
            ),
            Observer(
              builder: (_) {
                return SwitchButton(
                  name: "Notificações da Twitch",
                  active: optionsController.changeNotificationTwitch,
                  lineIcons: LineIcons.twitch,
                  onChanged: optionsController.setChangeNotificationTwitch,
                  textStyle: textStyle,
                );
              },
            ),
            SwitchButton(
              name: "Modo Dark",
              active: optionsController.changeNotificationTwitch,
              lineIcons: LineIcons.moon,
              onChanged: optionsController.setChangeNotificationTwitch,
              textStyle: textStyle,
            )
          ],
        ),
      ),
    );
  }
}
