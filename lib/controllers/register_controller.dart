import 'package:flutter/material.dart';
import 'package:goularte/helpers/extensions.dart';
import 'package:goularte/models/user.dart';
import 'package:goularte/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterController with _$RegisterController;

abstract class _RegisterController with Store {
  BuildContext context;

  // user
  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get _validName => name != null && name.length < 5;
  String get errorName {
    if (name != null && name.isEmpty) {
      return "Campo obrigatorio";
    } else if (_validName) {
      return "Nome de usuario muito curto";
    } else {
      return null;
    }
  }

  // email
  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get _validEmail => email != null && email.isEmailValid();
  String get errorEmail {
    if (email == null || _validEmail) {
      return null;
    } else if (email.isEmpty) {
      return 'Campo obrigatorio';
    } else {
      return 'Digite um e-mail valido';
    }
  }

  // passwords
  @observable
  String password;

  @observable
  String confirmPassword;

  @action
  void setPassword(String value) => password = value;

  @action
  void setConfirmPassword(String value) => confirmPassword = value;

  /// password
  @computed
  bool get _validPassword => password != null && password.length < 6;
  String get erroPassword {
    if (password != null && password.isEmpty) {
      return "Campo obrigatorio";
    } else if (_validPassword) {
      return "Senha muito curta";
    } else {
      return null;
    }
  }

  /// confirmpassword
  @computed
  bool get _validConfirmPassword =>
      confirmPassword != null && confirmPassword != password;
  @computed
  String get erroConfirmPassword {
    if (confirmPassword != null && confirmPassword.isEmpty) {
      return "Campo obrigatorio";
    } else if (_validConfirmPassword) {
      return "Senhas não são iguais";
    } else {
      return null;
    }
  }

  // button
  @computed
  bool get validForm =>
      name != null &&
      name.length >= 5 &&
      _validEmail &&
      password != null &&
      password.length >= 6 &&
      confirmPassword != null &&
      confirmPassword == password;

  @computed
  Function get sendForm => validForm ? postForm : null;

  @action
  Future<void> postForm() async {
    FocusScope.of(context).unfocus(); // tira o teclado da tela
    User user = User(name: name, email: email, password: password);
    try {
      loading = true;
      erro = null;
      bool response = await UserRepository().register(user);
      if (response) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      loading = false;
      erro = e.toString();
    }
    loading = false;
  }

  // screen

  @observable
  bool loading = false;

  @observable
  String erro;
}
