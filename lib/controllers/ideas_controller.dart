import 'package:goularte/models/ideas.dart';
import 'package:goularte/repositories/ideas_repository.dart';
import 'package:mobx/mobx.dart';

part 'ideas_controller.g.dart';

class IdeasController = _IdeasController with _$IdeasController;

abstract class _IdeasController with Store {
  _IdeasController() {
    getAllIdeas();
  }

  ObservableList<Ideas> ideasList = ObservableList<Ideas>();

  @observable
  String erro;
  bool loading = false;

  @action
  Future<void> getAllIdeas() async {
    loading = true;
    List<Ideas> ideas = await IdeasRepository().getAllIdeas();
    ideasList.addAll(ideas);
  }
}
