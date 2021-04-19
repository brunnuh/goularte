// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ideas_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IdeasController on _IdeasController, Store {
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

  @override
  String toString() {
    return '''
erro: ${erro},
loadingAll: ${loadingAll}
    ''';
  }
}
