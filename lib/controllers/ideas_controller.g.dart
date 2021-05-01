// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ideas_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IdeasController on _IdeasController, Store {
  Computed<bool> _$validFieldComputed;

  @override
  bool get validField =>
      (_$validFieldComputed ??= Computed<bool>(() => super.validField,
              name: '_IdeasController.validField'))
          .value;
  Computed<String> _$erroFieldComputed;

  @override
  String get erroField =>
      (_$erroFieldComputed ??= Computed<String>(() => super.erroField,
              name: '_IdeasController.erroField'))
          .value;
  Computed<int> _$countListIdeasComputed;

  @override
  int get countListIdeas =>
      (_$countListIdeasComputed ??= Computed<int>(() => super.countListIdeas,
              name: '_IdeasController.countListIdeas'))
          .value;

  final _$erroAtom = Atom(name: '_IdeasController.erro');

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

  final _$loadingAllAtom = Atom(name: '_IdeasController.loadingAll');

  @override
  bool get loadingAll {
    _$loadingAllAtom.reportRead();
    return super.loadingAll;
  }

  @override
  set loadingAll(bool value) {
    _$loadingAllAtom.reportWrite(value, super.loadingAll, () {
      super.loadingAll = value;
    });
  }

  final _$loadingTopAtom = Atom(name: '_IdeasController.loadingTop');

  @override
  bool get loadingTop {
    _$loadingTopAtom.reportRead();
    return super.loadingTop;
  }

  @override
  set loadingTop(bool value) {
    _$loadingTopAtom.reportWrite(value, super.loadingTop, () {
      super.loadingTop = value;
    });
  }

  final _$pageAtom = Atom(name: '_IdeasController.page');

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

  final _$descriptionAtom = Atom(name: '_IdeasController.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$responseAtom = Atom(name: '_IdeasController.response');

  @override
  bool get response {
    _$responseAtom.reportRead();
    return super.response;
  }

  @override
  set response(bool value) {
    _$responseAtom.reportWrite(value, super.response, () {
      super.response = value;
    });
  }

  final _$lastPageAtom = Atom(name: '_IdeasController.lastPage');

  @override
  bool get lastPage {
    _$lastPageAtom.reportRead();
    return super.lastPage;
  }

  @override
  set lastPage(bool value) {
    _$lastPageAtom.reportWrite(value, super.lastPage, () {
      super.lastPage = value;
    });
  }

  final _$getTopIdeasAsyncAction = AsyncAction('_IdeasController.getTopIdeas');

  @override
  Future<void> getTopIdeas() {
    return _$getTopIdeasAsyncAction.run(() => super.getTopIdeas());
  }

  final _$getAllIdeasAsyncAction = AsyncAction('_IdeasController.getAllIdeas');

  @override
  Future<void> getAllIdeas() {
    return _$getAllIdeasAsyncAction.run(() => super.getAllIdeas());
  }

  final _$likeIdeaAsyncAction = AsyncAction('_IdeasController.likeIdea');

  @override
  Future<void> likeIdea(Ideas idea) {
    return _$likeIdeaAsyncAction.run(() => super.likeIdea(idea));
  }

  final _$postIdeaAsyncAction = AsyncAction('_IdeasController.postIdea');

  @override
  Future<void> postIdea() {
    return _$postIdeaAsyncAction.run(() => super.postIdea());
  }

  final _$_IdeasControllerActionController =
      ActionController(name: '_IdeasController');

  @override
  void nextPage() {
    final _$actionInfo = _$_IdeasControllerActionController.startAction(
        name: '_IdeasController.nextPage');
    try {
      return super.nextPage();
    } finally {
      _$_IdeasControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_IdeasControllerActionController.startAction(
        name: '_IdeasController.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_IdeasControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFields() {
    final _$actionInfo = _$_IdeasControllerActionController.startAction(
        name: '_IdeasController.clearFields');
    try {
      return super.clearFields();
    } finally {
      _$_IdeasControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNewsIdeas(List<Ideas> newIdeas) {
    final _$actionInfo = _$_IdeasControllerActionController.startAction(
        name: '_IdeasController.addNewsIdeas');
    try {
      return super.addNewsIdeas(newIdeas);
    } finally {
      _$_IdeasControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
erro: ${erro},
loadingAll: ${loadingAll},
loadingTop: ${loadingTop},
page: ${page},
description: ${description},
response: ${response},
lastPage: ${lastPage},
validField: ${validField},
erroField: ${erroField},
countListIdeas: ${countListIdeas}
    ''';
  }
}
