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

  final _$getAllWithTopAsyncAction =
      AsyncAction('_IdeasController.getAllWithTop');

  @override
  Future<void> getAllWithTop() {
    return _$getAllWithTopAsyncAction.run(() => super.getAllWithTop());
  }

  final _$getAllIdeasAsyncAction = AsyncAction('_IdeasController.getAllIdeas');

  @override
  Future<void> getAllIdeas() {
    return _$getAllIdeasAsyncAction.run(() => super.getAllIdeas());
  }

  final _$getTopIdeasAsyncAction = AsyncAction('_IdeasController.getTopIdeas');

  @override
  Future<void> getTopIdeas() {
    return _$getTopIdeasAsyncAction.run(() => super.getTopIdeas());
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
  String toString() {
    return '''
erro: ${erro},
loadingAll: ${loadingAll},
description: ${description},
response: ${response},
validField: ${validField},
erroField: ${erroField}
    ''';
  }
}
