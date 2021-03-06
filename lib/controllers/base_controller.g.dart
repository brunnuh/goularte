// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BaseController on _BaseController, Store {
  final _$pageAtom = Atom(name: '_BaseController.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$noInternetAtom = Atom(name: '_BaseController.noInternet');

  @override
  bool get noInternet {
    _$noInternetAtom.reportRead();
    return super.noInternet;
  }

  @override
  set noInternet(bool value) {
    _$noInternetAtom.reportWrite(value, super.noInternet, () {
      super.noInternet = value;
    });
  }

  final _$_BaseControllerActionController =
      ActionController(name: '_BaseController');

  @override
  void setPage(int value) {
    final _$actionInfo = _$_BaseControllerActionController.startAction(
        name: '_BaseController.setPage');
    try {
      return super.setPage(value);
    } finally {
      _$_BaseControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatusInternet(bool value) {
    final _$actionInfo = _$_BaseControllerActionController.startAction(
        name: '_BaseController.setStatusInternet');
    try {
      return super.setStatusInternet(value);
    } finally {
      _$_BaseControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
noInternet: ${noInternet}
    ''';
  }
}
