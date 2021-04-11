// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginController, Store {
  Computed<bool> _$validEmailComputed;

  @override
  bool get validEmail =>
      (_$validEmailComputed ??= Computed<bool>(() => super.validEmail,
              name: '_LoginController.validEmail'))
          .value;
  Computed<bool> _$validPasswordComputed;

  @override
  bool get validPassword =>
      (_$validPasswordComputed ??= Computed<bool>(() => super.validPassword,
              name: '_LoginController.validPassword'))
          .value;
  Computed<bool> _$pressedButtonComputed;

  @override
  bool get pressedButton =>
      (_$pressedButtonComputed ??= Computed<bool>(() => super.pressedButton,
              name: '_LoginController.pressedButton'))
          .value;
  Computed<Function> _$isValidFormComputed;

  @override
  Function get isValidForm =>
      (_$isValidFormComputed ??= Computed<Function>(() => super.isValidForm,
              name: '_LoginController.isValidForm'))
          .value;

  final _$emailAtom = Atom(name: '_LoginController.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$userAtom = Atom(name: '_LoginController.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginController.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$loadingAtom = Atom(name: '_LoginController.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorAtom = Atom(name: '_LoginController.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$_loginAsyncAction = AsyncAction('_LoginController._login');

  @override
  Future<void> _login() {
    return _$_loginAsyncAction.run(() => super._login());
  }

  final _$_verifyTokenAsyncAction =
      AsyncAction('_LoginController._verifyToken');

  @override
  Future<void> _verifyToken() {
    return _$_verifyTokenAsyncAction.run(() => super._verifyToken());
  }

  final _$_LoginControllerActionController =
      ActionController(name: '_LoginController');

  @override
  void setUser(User value) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFields() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.clearFields');
    try {
      return super.clearFields();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
user: ${user},
password: ${password},
loading: ${loading},
error: ${error},
validEmail: ${validEmail},
validPassword: ${validPassword},
pressedButton: ${pressedButton},
isValidForm: ${isValidForm}
    ''';
  }
}
