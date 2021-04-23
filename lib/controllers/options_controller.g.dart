// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OptionsController on _OptionsController, Store {
  final _$changeNotificationYoutubeAtom =
      Atom(name: '_OptionsController.changeNotificationYoutube');

  @override
  bool get changeNotificationYoutube {
    _$changeNotificationYoutubeAtom.reportRead();
    return super.changeNotificationYoutube;
  }

  @override
  set changeNotificationYoutube(bool value) {
    _$changeNotificationYoutubeAtom
        .reportWrite(value, super.changeNotificationYoutube, () {
      super.changeNotificationYoutube = value;
    });
  }

  final _$changeNotificationTwitchAtom =
      Atom(name: '_OptionsController.changeNotificationTwitch');

  @override
  bool get changeNotificationTwitch {
    _$changeNotificationTwitchAtom.reportRead();
    return super.changeNotificationTwitch;
  }

  @override
  set changeNotificationTwitch(bool value) {
    _$changeNotificationTwitchAtom
        .reportWrite(value, super.changeNotificationTwitch, () {
      super.changeNotificationTwitch = value;
    });
  }

  final _$_OptionsControllerActionController =
      ActionController(name: '_OptionsController');

  @override
  void setChangeNotificationYoutube(bool value) {
    final _$actionInfo = _$_OptionsControllerActionController.startAction(
        name: '_OptionsController.setChangeNotificationYoutube');
    try {
      return super.setChangeNotificationYoutube(value);
    } finally {
      _$_OptionsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setChangeNotificationTwitch(bool value) {
    final _$actionInfo = _$_OptionsControllerActionController.startAction(
        name: '_OptionsController.setChangeNotificationTwitch');
    try {
      return super.setChangeNotificationTwitch(value);
    } finally {
      _$_OptionsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
changeNotificationYoutube: ${changeNotificationYoutube},
changeNotificationTwitch: ${changeNotificationTwitch}
    ''';
  }
}
