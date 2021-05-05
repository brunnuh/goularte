import 'package:flutter/material.dart';
import 'package:goularte/repositories/shared_preference.dart';
import 'package:goularte/views/base/base_view.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      this.initView();
    });
  }

  initView() async {
    _Splash.start(context);
    // verificacoes antes de entrar
    // ...
    await SharedPreference().isAnotherDay().then((value) {
      if (value) {
        SharedPreference().amountSubmittedIdeas(reset: true);
      }
    });
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => BaseView()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class _Splash {
  static Future<Widget> start(BuildContext context) {
    return showDialog(
        context: context,
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffD15458),
                  Color(0xffe65758),
                  Color(0xff771d32),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(300),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/image1.jpg"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                )
              ],
            ),
          ),
        ));
  }
}
