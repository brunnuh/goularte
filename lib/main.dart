import 'package:flutter/material.dart';
import 'package:goularte/views/base/base_view.dart';

void main() {
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
          backgroundColor: Color(0xffD55759),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: BaseView(),
    );
  }
}
