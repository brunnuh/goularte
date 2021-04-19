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
}
