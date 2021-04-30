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

  final _$existAtom = Atom(name: '_ArtController.exist');

  @override
  bool get exist {
    _$existAtom.reportRead();
    return super.exist;
  }

  @override
  set exist(bool value) {
    _$existAtom.reportWrite(value, super.exist, () {
      super.exist = value;
    });
  }

  final _$loadingSaveAtom = Atom(name: '_ArtController.loadingSave');

  @override
  bool get loadingSave {
    _$loadingSaveAtom.reportRead();
    return super.loadingSave;
  }

  @override
  set loadingSave(bool value) {
    _$loadingSaveAtom.reportWrite(value, super.loadingSave, () {
      super.loadingSave = value;
    });
  }

  final _$pageAtom = Atom(name: '_ArtController.page');

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

  final _$lastArtAtom = Atom(name: '_ArtController.lastArt');

  @override
  bool get lastArt {
    _$lastArtAtom.reportRead();
    return super.lastArt;
  }

  @override
  set lastArt(bool value) {
    _$lastArtAtom.reportWrite(value, super.lastArt, () {
      super.lastArt = value;
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

  final _$setExistAsyncAction = AsyncAction('_ArtController.setExist');

  @override
  Future<void> setExist(String name) {
    return _$setExistAsyncAction.run(() => super.setExist(name));
  }

  final _$saveArtAsyncAction = AsyncAction('_ArtController.saveArt');

  @override
  Future<void> saveArt(File file) {
    return _$saveArtAsyncAction.run(() => super.saveArt(file));
  }

  final _$_ArtControllerActionController =
      ActionController(name: '_ArtController');

  @override
  void addNewArt(List<Art> newArts) {
    final _$actionInfo = _$_ArtControllerActionController.startAction(
        name: '_ArtController.addNewArt');
    try {
      return super.addNewArt(newArts);
    } finally {
      _$_ArtControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExistForced() {
    final _$actionInfo = _$_ArtControllerActionController.startAction(
        name: '_ArtController.setExistForced');
    try {
      return super.setExistForced();
    } finally {
      _$_ArtControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_ArtControllerActionController.startAction(
        name: '_ArtController.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_ArtControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextPage() {
    final _$actionInfo = _$_ArtControllerActionController.startAction(
        name: '_ArtController.nextPage');
    try {
      return super.nextPage();
    } finally {
      _$_ArtControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNullInErro() {
    final _$actionInfo = _$_ArtControllerActionController.startAction(
        name: '_ArtController.setNullInErro');
    try {
      return super.setNullInErro();
    } finally {
      _$_ArtControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
erro: ${erro},
loading: ${loading},
exist: ${exist},
loadingSave: ${loadingSave},
page: ${page},
lastArt: ${lastArt}
    ''';
  }
}
