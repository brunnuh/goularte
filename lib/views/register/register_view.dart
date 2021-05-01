import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:goularte/controllers/register_controller.dart';
import 'package:goularte/views/globals/button_custom.dart';
import 'package:goularte/views/globals/error_box.dart';
import 'package:goularte/views/globals/loading.dart';
import 'package:goularte/views/globals/text_field_custom.dart';

class RegisterView extends StatelessWidget {
  RegisterController registerController = RegisterController();
  @override
  Widget build(BuildContext context) {
    registerController.context = context;

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            iconTheme: IconThemeData(color: Colors.redAccent),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Observer(
                    builder: (_) {
                      return registerController.erro != null
                          ? ErrorBox(registerController.erro)
                          : Container();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Observer(
                    builder: (_) {
                      return TextFieldCustom(
                        labelText: "Usuario",
                        keyboardType: TextInputType.name,
                        onChanged: registerController.setName,
                        erroText: registerController.errorName,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Observer(
                    builder: (_) {
                      return TextFieldCustom(
                        labelText: "E-mail",
                        keyboardType: TextInputType.emailAddress,
                        onChanged: registerController.setEmail,
                        erroText: registerController.errorEmail,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Observer(builder: (_) {
                    return TextFieldCustom(
                      labelText: "Senha",
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: registerController.setPassword,
                      erroText: registerController.erroPassword,
                    );
                  }),
                  const SizedBox(
                    height: 7,
                  ),
                  Observer(
                    builder: (_) {
                      return TextFieldCustom(
                        labelText: "Confirmar senha",
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: registerController.setConfirmPassword,
                        erroText: registerController.erroConfirmPassword,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Observer(builder: (_) {
                    return ButtonCustom(
                      labelTitle: "Cadastrar",
                      onPressed: registerController.sendForm,
                      loading: false,
                      pressedButton: registerController.validForm,
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
        Observer(builder: (_) {
          return registerController.loading ? Loading() : Container();
        })
      ],
    );
  }
}
