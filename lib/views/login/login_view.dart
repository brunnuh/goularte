import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/login_controller.dart';
import 'package:goularte/views/globals/button_custom.dart';
import 'package:goularte/views/globals/error_box.dart';
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
                  return TextField(
                    onChanged: loginController.setEmail,
                    enabled: !loginController.loading,
                    cursorColor: Theme.of(context).appBarTheme.color,
                    decoration: InputDecoration(
                      errorText: loginController.errorEmail,
                      labelText: 'E-mail',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      isDense: true,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  );
                },
              ),
              const SizedBox(
                height: 7,
              ),
              Observer(
                builder: (_) {
                  return TextField(
                    onChanged: loginController.setPassword,
                    enabled: !loginController.loading,
                    cursorColor: Theme.of(context).appBarTheme.color,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      errorText: loginController.errorPassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          !loginController.passwordVisible
                              ? LineIcons.eye
                              : LineIcons.eyeSlashAlt,
                        ),
                        onPressed: loginController.setVisible,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color: Theme.of(context).appBarTheme.color ??
                              Colors.redAccent,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color: Theme.of(context).appBarTheme.color ??
                              Colors.redAccent,
                        ),
                      ),
                      isDense: true,
                    ),
                    obscureText: !loginController.passwordVisible,
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
