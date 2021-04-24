// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'help_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HelpController on _HelpController, Store {
  final _$msgCopyAtom = Atom(name: '_HelpController.msgCopy');

  @override
  bool get msgCopy {
    _$msgCopyAtom.reportRead();
    return super.msgCopy;
  }

  @override
  set msgCopy(bool value) {
    _$msgCopyAtom.reportWrite(value, super.msgCopy, () {
      super.msgCopy = value;
    });
  }

  final _$_HelpControllerActionController =
      ActionController(name: '_HelpController');

  @override
  void setMsgCopy() {
    final _$actionInfo = _$_HelpControllerActionController.startAction(
        name: '_HelpController.setMsgCopy');
    try {
      return super.setMsgCopy();
    } finally {
      _$_HelpControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
msgCopy: ${msgCopy}
    ''';
  }
}
