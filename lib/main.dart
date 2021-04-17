import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/base_controller.dart';
import 'package:goularte/controllers/login_controller.dart';
import 'package:goularte/controllers/parse_controller.dart';
import 'package:goularte/views/base/base_view.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

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
      home: BaseView(),
    );
  }
}

void setupLocators() {
  GetIt.I.registerSingleton(LoginController());
  GetIt.I.registerSingleton(ParseController());
  GetIt.I.registerSingleton(BaseController());
}

Future<void> initializeParse() async {
  await Parse().initialize(
    "AysCMUk2jPRttEI2DqDzQZSgxukmP8QweUWFSr9T",
    "https://parseapi.back4app.com/",
    clientKey: "r5GE9zPM5Z9Vfs7VO4QRIBNc3AdnVPSnKfN6XzB9",
    autoSendSessionId: true,
    debug: true,
  );
}
