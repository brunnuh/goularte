import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/login_controller.dart';
import 'package:goularte/views/globals/error_box.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginController loginController = GetIt.I<LoginController>();
    loginController.context = context;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.redAccent),
      ),
      body: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Observer(
                builder: (_) {
                  return loginController.error != null
                      ? ErrorBox(loginController.error)
                      : Container();
                },
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
                    return ElevatedButton(
                      onPressed: loginController.isValidForm,
                      child: loginController.loading
                          ? SizedBox(
                              width: 23,
                              height: 23,
                              child: CircularProgressIndicator(
                                strokeWidth: 4,
                                valueColor: AlwaysStoppedAnimation(
                                    Theme.of(context).appBarTheme.color),
                              ),
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          !loginController.pressedButton
                              ? Colors.grey
                              : Theme.of(context).appBarTheme.color,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}