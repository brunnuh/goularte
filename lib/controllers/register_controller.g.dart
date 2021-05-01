// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterController, Store {
  Computed<bool> _$_validNameComputed;

  @override
  bool get _validName =>
      (_$_validNameComputed ??= Computed<bool>(() => super._validName,
              name: '_RegisterController._validName'))
          .value;
  Computed<bool> _$_validEmailComputed;

  @override
  bool get _validEmail =>
      (_$_validEmailComputed ??= Computed<bool>(() => super._validEmail,
              name: '_RegisterController._validEmail'))
          .value;
  Computed<bool> _$_validPasswordComputed;

  @override
  bool get _validPassword =>
      (_$_validPasswordComputed ??= Computed<bool>(() => super._validPassword,
              name: '_RegisterController._validPassword'))
          .value;
  Computed<bool> _$_validConfirmPasswordComputed;

  @override
  bool get _validConfirmPassword => (_$_validConfirmPasswordComputed ??=
          Computed<bool>(() => super._validConfirmPassword,
              name: '_RegisterController._validConfirmPassword'))
      .value;
  Computed<String> _$erroConfirmPasswordComputed;

  @override
  String get erroConfirmPassword => (_$erroConfirmPasswordComputed ??=
          Computed<String>(() => super.erroConfirmPassword,
              name: '_RegisterController.erroConfirmPassword'))
      .value;
  Computed<bool> _$validFormComputed;

  @override
  bool get validForm =>
      (_$validFormComputed ??= Computed<bool>(() => super.validForm,
              name: '_RegisterController.validForm'))
          .value;
  Computed<Function> _$sendFormComputed;

  @override
  Function get sendForm =>
      (_$sendFormComputed ??= Computed<Function>(() => super.sendForm,
              name: '_RegisterController.sendForm'))
          .value;

  final _$nameAtom = Atom(name: '_RegisterController.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_RegisterController.email');

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

  final _$passwordAtom = Atom(name: '_RegisterController.password');

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

  final _$confirmPasswordAtom =
      Atom(name: '_RegisterController.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$loadingAtom = Atom(name: '_RegisterController.loading');

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

  final _$erroAtom = Atom(name: '_RegisterController.erro');

  @override
  String get erro {
    _$erroAtom.reportRead();
    return super.erro;
  }

  @override
  set erro(String value) {
    _$erroAtom.reportWrite(value, super.erro, () {
      super.erro = value;
    });
  }

  final _$postFormAsyncAction = AsyncAction('_RegisterController.postForm');

  @override
  Future<void> postForm() {
    return _$postFormAsyncAction.run(() => super.postForm());
  }

  final _$_RegisterControllerActionController =
      ActionController(name: '_RegisterController');

  @override
  void setName(String value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.setName');
    try {
      return super.setName(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
loading: ${loading},
erro: ${erro},
erroConfirmPassword: ${erroConfirmPassword},
validForm: ${validForm},
sendForm: ${sendForm}
    ''';
  }
}
