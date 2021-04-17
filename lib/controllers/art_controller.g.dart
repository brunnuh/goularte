// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'art_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ArtController on _ArtController, Store {
  final _$erroAtom = Atom(name: '_ArtController.erro');

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

  final _$loadingAtom = Atom(name: '_ArtController.loading');

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

  final _$getArtsAsyncAction = AsyncAction('_ArtController.getArts');

  @override
  Future<void> getArts() {
    return _$getArtsAsyncAction.run(() => super.getArts());
  }

  final _$downloadArtAsyncAction = AsyncAction('_ArtController.downloadArt');

  @override
  Future<void> downloadArt(String url, String name) {
    return _$downloadArtAsyncAction.run(() => super.downloadArt(url, name));
  }

  @override
  String toString() {
    return '''
erro: ${erro},
loading: ${loading}
    ''';
  }
}
