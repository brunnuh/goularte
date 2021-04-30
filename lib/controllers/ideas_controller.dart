import 'package:goularte/models/ideas.dart';
import 'package:goularte/repositories/ideas_repository.dart';
import 'package:mobx/mobx.dart';

part 'ideas_controller.g.dart';

class IdeasController = _IdeasController with _$IdeasController;

abstract class _IdeasController with Store {
  _IdeasController() {
    getTopIdeas();
    autorun((_) async {
      if (nextPage == 0) {
        loadingAll = true;
      }
      try {
        List<Ideas> newIdeas = await IdeasRepository().getIdeas(nextPage);
        addNewsIdeas(newIdeas);
      } catch (e) {
        lastPage = true;
      }
      loadingAll = false;
    });
  }
  ObservableList<Ideas> ideasList = ObservableList<Ideas>();

  @observable
  String erro;

  @observable
  bool loadingAll = false;
  bool loadingTop = false;

  // é usado para delimitar a paginacao
  @observable
  int nextPage = 0;

  ObservableList<Ideas> topIdeas = ObservableList<Ideas>();

  @action
  Future<void> getTopIdeas() async {
    try {
      loadingTop = true;
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
  void getNextPage() => nextPage++;

  @action
  Future<void> getAllIdeas() async {
    try {
      loadingAll = true;
      await getTopIdeas();
      List<Ideas> newIdeas = await IdeasRepository().getIdeas(nextPage);
      ideasList.clear();
      ideasList.addAll(newIdeas);
      nextPage = 1;
      lastPage = false;
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

  @observable
  bool lastPage = false;

  @action
  void addNewsIdeas(List<Ideas> newIdeas) {
    if (newIdeas.length < IdeasRepository().limit) {
      lastPage = true;
    }
    ideasList.addAll(newIdeas);
  }

  @computed
  int get countListIdeas => lastPage ? ideasList.length : ideasList.length + 1;
}
