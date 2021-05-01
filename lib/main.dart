import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/art_controller.dart';
import 'package:goularte/controllers/base_controller.dart';
import 'package:goularte/controllers/ideas_controller.dart';
import 'package:goularte/controllers/info_app_controller.dart';
import 'package:goularte/controllers/login_controller.dart';
import 'package:goularte/controllers/parse_controller.dart';
import 'package:goularte/controllers/splash_controller.dart';
import 'package:goularte/views/splash/splash_view.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'controllers/options_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: false);

  await initializeParse();
  setupLocators();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // inicia o one signal
    OneSignal.shared.init("000939ed-4c49-42b9-906d-c03324223e10");
    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);
    return MaterialApp(
      title: 'goularte app',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffF4F3EE),
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Color(0xffD55759),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}

void setupLocators() {
  GetIt.I.registerSingleton(LoginController());
  GetIt.I.registerSingleton(ParseController());
  GetIt.I.registerSingleton(IdeasController());
  GetIt.I.registerSingleton(ArtController());
  GetIt.I.registerSingleton(BaseController());
  GetIt.I.registerSingleton(InfoAppController());
  GetIt.I.registerSingleton(SplashController());
  GetIt.I.registerSingleton(OptionsController());
}

Future<void> initializeParse() async {
  await Parse().initialize(
    "AysCMUk2jPRttEI2DqDzQZSgxukmP8QweUWFSr9T",
    "https://parseapi.back4app.com/",
    clientKey: "r5GE9zPM5Z9Vfs7VO4QRIBNc3AdnVPSnKfN6XzB9",
    autoSendSessionId: true,
    debug: false,
  );
}
