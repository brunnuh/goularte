// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InfoAppController on _InfoAppController, Store {
  final _$packageInfoAtom = Atom(name: '_InfoAppController.packageInfo');

  @override
  PackageInfo get packageInfo {
    _$packageInfoAtom.reportRead();
    return super.packageInfo;
  }

  @override
  set packageInfo(PackageInfo value) {
    _$packageInfoAtom.reportWrite(value, super.packageInfo, () {
      super.packageInfo = value;
    });
  }

  final _$_getVersionAsyncAction =
      AsyncAction('_InfoAppController._getVersion');

  @override
  Future<void> _getVersion() {
    return _$_getVersionAsyncAction.run(() => super._getVersion());
  }

  @override
  String toString() {
    return '''
packageInfo: ${packageInfo}
    ''';
  }
}
