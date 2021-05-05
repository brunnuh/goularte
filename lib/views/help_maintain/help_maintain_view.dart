import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:goularte/controllers/help_controller.dart';
import 'package:goularte/views/help_maintain/components/custom_button.dart';

class HelpMaintainView extends StatelessWidget {
  HelpController helpController = HelpController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Theme.of(context).appBarTheme.color),
      ),
      body: Observer(
        builder: (_) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Image.asset(
                          "assets/porco-donation.png",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Nada é de graça, não é verdade?",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.deepPurple,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Esse app foi criado com o intuito de agregar meus estudos, alavancar minha carreira como desenvolvedor mobile e porque sou fã do Gou, então ajude a mantê-lo de pé.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 15,
                        child: Image.asset("assets/pix.png"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        fieldText: "desenvolvedorbs@gmail.com",
                        iconData: Icons.content_copy,
                        onTap: () async {
                          helpController.setMsgCopy();
                          Clipboard.setData(
                              ClipboardData(text: "desenvolvedorbs@gmail.com"));
                          await Future.delayed(Duration(seconds: 1));
                          helpController.setMsgCopy();
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomButton(
                        fieldText: "qr code",
                        iconData: Icons.arrow_forward,
                        onTap: () {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Container(
                                  child:
                                      Image.asset("assets/qrcode-modelo.png"),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.02,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: AnimatedDefaultTextStyle(
                    style: helpController.msgCopy
                        ? TextStyle(color: Colors.black)
                        : TextStyle(color: Colors.transparent),
                    duration: Duration(milliseconds: 400),
                    child: Text(
                      "Chave copiada!",
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
