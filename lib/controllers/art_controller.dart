import 'dart:io' as io;

import 'package:goularte/models/art.dart';
import 'package:goularte/repositories/art_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';

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
      setLoading(true);
      await ArtRepository().downloadArt(url, name).then((value) async {
        if (value) {
          await setExistForced();
        }
      });

      setLoading(false);
    } catch (e) {
      erro = e;
    }
  }

  @observable
  bool exist = false;

  @action
  Future<void> setExist(String name) async {
    var directory = await getExternalStorageDirectory();
    String path = directory.path + "/" + name;
    exist = await io.File(await path).exists();
  }

  @action
  void setExistForced() => exist = true;

  @action
  void setLoading(bool value) => loading = value;
}
