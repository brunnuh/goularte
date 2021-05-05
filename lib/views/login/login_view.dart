import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/login_controller.dart';
import 'package:goularte/views/globals/button_custom.dart';
import 'package:goularte/views/globals/error_box.dart';
import 'package:goularte/views/globals/text_field_custom.dart';
import 'package:goularte/views/register/register_view.dart';
import 'package:line_icons/line_icons.dart';

class LoginView extends StatelessWidget {
  LoginController loginController = GetIt.I<LoginController>();

  @override
  Widget build(BuildContext context) {
    loginController.context = context;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(
            color: !loginController.loading ? Colors.redAccent : Colors.grey),
        leading: IconButton(
          icon: Icon(LineIcons.arrowLeft),
          onPressed: () =>
              !loginController.loading ? Navigator.of(context).pop() : null,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              CircleAvatar(
                radius: 65,
                backgroundImage: AssetImage('assets/image1.jpg'),
              ),
              const SizedBox(
                height: 50,
              ),
              Observer(
                builder: (_) {
                  return loginController.error != null
                      ? ErrorBox(loginController.error)
                      : Container();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Observer(
                builder: (_) {
                  return TextFieldCustom(
                    onChanged: loginController.setEmail,
                    enable: !loginController.loading,
                    erroText: loginController.errorEmail,
                    obscureText: false,
                    labelText: "E-mail",
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: null,
                  );
                },
              ),
              const SizedBox(
                height: 7,
              ),
              Observer(
                builder: (_) {
                  return TextFieldCustom(
                    onChanged: loginController.setPassword,
                    erroText: loginController.errorPassword,
                    keyboardType: TextInputType.text,
                    enable: !loginController.loading,
                    obscureText: !loginController.passwordVisible,
                    labelText: "Senha",
                    suffixIcon: IconButton(
                      icon: Icon(
                        !loginController.passwordVisible
                            ? LineIcons.eye
                            : LineIcons.eyeSlashAlt,
                      ),
                      onPressed: loginController.setVisible,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: Observer(
                  builder: (_) {
                    return ButtonCustom(
                      onPressed: loginController.isValidForm,
                      loading: loginController.loading,
                      pressedButton: loginController.pressedButton,
                      labelTitle: "Login",
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (_) => RegisterView(),
                    ),
                  );
                },
                child: Container(
                  child: Text.rich(
                    TextSpan(
                      text: "Não tem conta? ",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                          text: "cadastrar",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
