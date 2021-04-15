import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goularte/helpers/extensions.dart';
import 'package:goularte/models/user.dart';
import 'package:goularte/repositories/user_repository.dart';
import 'package:goularte/views/base/base_view.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  BuildContext context;

  _LoginController() {
    _verifyToken();
  }

  @observable
  String email;

  @observable
  User user = User();

  @action
  void setUser(User value) => user = value;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get validEmail => email != null && email.isEmailValid();
  String get errorEmail {
    if (email == null || validEmail) {
      return null;
    } else if (email.isEmpty) {
      return 'Campo obrigatorio';
    } else {
      return 'Digite um e-mail valido';
    }
  }

  @observable
  String password;

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void clearFields() {
    email = null;
    password = null;
    user = User();
  }

  @computed
  bool get validPassword => password != null && password.length >= 4;
  String get errorPassword {
    if (password == null || validPassword)
      return null;
    else if (password != null && password.isEmpty)
      return 'Campo obrigatorio';
    else
      return 'Senha muito pequena';
  }

  @observable
  bool loading = false;

  @observable
  String error;

  @computed
  bool get pressedButton => validEmail && validPassword;

  @computed
  Function get isValidForm => validEmail && validPassword ? _login : null;

  @action
  Future<void> _login() async {
    loading = true;
    try {
      error = null;
      user =
          await UserRepository().login(User(email: email, password: password));
      if (user != null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (_) => BaseView(
                      page: 3,
                    )),
            (route) => false);
      }
    } catch (e) {
      error = e;
    }
    loading = false;
  }

  @action
  Future<void> _verifyToken() async {
    user = await UserRepository().verifyToken();
  }

  @observable
  bool passwordVisible = false;

  @action
  void setVisible() => passwordVisible = !passwordVisible;
}
