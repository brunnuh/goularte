import 'package:goularte/models/art.dart';
import 'package:goularte/repositories/art_repository.dart';
import 'package:mobx/mobx.dart';

part 'art_controller.g.dart';

class ArtController = _ArtController with _$ArtController;

abstract class _ArtController with Store {
  ObservableList<Art> arts = ObservableList<Art>();

  @observable
  String erro;

  @observable
  bool loading = false;

  @action
  Future<void> getArts() async {
    arts.clear();
    try {
      final newArts = await ArtRepository().getArts();
      arts.addAll(newArts);
      erro = null;
    } catch (e) {
      erro = e;
    }
  }

  @action
  Future<void> downloadArt(String url, String name) async {
    try {
      erro = null;
      loading = true;
      await ArtRepository().downloadArt(url, name);
      loading = false;
    } catch (e) {
      erro = e;
    }
  }
}
