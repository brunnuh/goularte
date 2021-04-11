// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parse_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ParseController on _ParseController, Store {
  final _$loadingAtom = Atom(name: '_ParseController.loading');

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

  final _$uploadPhotoAsyncAction = AsyncAction('_ParseController.uploadPhoto');

  @override
  Future<void> uploadPhoto(File file) {
    return _$uploadPhotoAsyncAction.run(() => super.uploadPhoto(file));
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
