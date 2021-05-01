// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OptionsController on _OptionsController, Store {
  final _$changeNotificationAtom =
      Atom(name: '_OptionsController.changeNotification');

  @override
  bool get changeNotification {
    _$changeNotificationAtom.reportRead();
    return super.changeNotification;
  }

  @override
  set changeNotification(bool value) {
    _$changeNotificationAtom.reportWrite(value, super.changeNotification, () {
      super.changeNotification = value;
    });
  }

  final _$setChangeNotificationAsyncAction =
      AsyncAction('_OptionsController.setChangeNotification');

  @override
  Future<void> setChangeNotification(bool value) {
    return _$setChangeNotificationAsyncAction
        .run(() => super.setChangeNotification(value));
  }

  final _$getValueNotificationAsyncAction =
      AsyncAction('_OptionsController.getValueNotification');

  @override
  Future<void> getValueNotification() {
    return _$getValueNotificationAsyncAction
        .run(() => super.getValueNotification());
  }

  @override
  String toString() {
    return '''
changeNotification: ${changeNotification}
    ''';
  }
}
