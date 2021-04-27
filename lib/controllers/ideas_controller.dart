import 'package:goularte/models/ideas.dart';
import 'package:goularte/repositories/ideas_repository.dart';
import 'package:mobx/mobx.dart';

part 'ideas_controller.g.dart';

class IdeasController = _IdeasController with _$IdeasController;

abstract class _IdeasController with Store {
  _IdeasController() {
    getAllWithTop();
  }

  ObservableList<Ideas> ideasList = ObservableList<Ideas>();

  @observable
  String erro;

  @observable
  bool loadingAll = false;
  bool loadingTop = false;

  ObservableList<Ideas> topIdeas = ObservableList<Ideas>();

  @action
  Future<void> getAllWithTop() async {
    try {
      loadingAll = true;
      loadingTop = true;
      erro = null;
      // lista de todas as ideias
      ideasList.clear();
      List<Ideas> ideas = await IdeasRepository().getAllIdeas();
      ideasList.addAll(ideas);
      loadingAll = false;

      // top 3 mais curtidas
      await getTopIdeas();
    } catch (e) {
      loadingTop = false;
      loadingAll = false;
      erro = e;
    }
  }

  @action
  Future<void> getAllIdeas() async {
    try {
      loadingAll = true;
      erro = null;
      ideasList.clear();
      List<Ideas> ideas = await IdeasRepository().getAllIdeas();
      ideasList.addAll(ideas);
      loadingAll = false;
    } catch (e) {
      loadingAll = false;
      erro = e;
    }
  }

  @action
  Future<void> getTopIdeas() async {
    try {
      topIdeas.clear();
      List<Ideas> ideas = await IdeasRepository().getTopIdeas();
      topIdeas.addAll(ideas);
      loadingTop = false;
    } catch (e) {
      loadingTop = false;
      loadingAll = false;
      erro = e;
    }
  }

  @action
  Future<void> likeIdea(Ideas idea) async {
    try {
      loadingAll = true;
      //erro = null;
      List updateIdea = await IdeasRepository().likeIdea(idea);
      ideasList.remove(idea);
      idea.likes = updateIdea.last;
      idea.already_voted = updateIdea.first;
      ideasList.add(idea);
      loadingAll = false;
    } catch (e) {
      loadingAll = false;
      erro = e;
    }
  }

  @observable
  String description;

  @observable
  bool response;

  int length = 250;

  @action
  void setDescription(String value) => description = value;

  @action
  Future<void> postIdea() async {
    try {
      loadingAll = true;
      response = await IdeasRepository().postIdea(description);
      loadingAll = false;
    } catch (e) {
      loadingAll = false;
      erro = e;
    }
  }

  @action
  void clearFields() {
    erro = null;
    response = null;
    description = null;
  }

  @computed
  bool get validField =>
      description != null && description != "" && description.length > length;
  bool get onButton =>
      description != null &&
      description.isNotEmpty &&
      description != "" &&
      description.replaceAll(" ", "") != "" &&
      description.length <= length;

  @computed
  String get erroField {
    if (validField) {
      return "Texto muito grande";
    } else if (description != null && description.isEmpty) {
      return "Digite algo";
    }
  }
}
