import 'dart:io';

import 'package:goularte/models/art.dart';
import 'package:goularte/repositories/art_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';

part 'art_controller.g.dart';

class ArtController = _ArtController with _$ArtController;

abstract class _ArtController with Store {
  _ArtController() {
    autorun((_) async {
      try {
        final newArts = await ArtRepository().getArts(page);
        addNewArt(newArts);
      } catch (e) {
        lastArt = true;
      }
    });
  }

  @action
  void addNewArt(List<Art> newArts) {
    if (newArts.length < ArtRepository().limit) {
      lastArt = true;
    }
    arts.addAll(newArts);
  }

  ObservableList<Art> arts = ObservableList<Art>();

  @observable
  String erro;

  @observable
  bool loading = false;

  @action
  Future<void> getArts() async {
    arts.clear();
    try {
      final newArts = await ArtRepository().getArts(page);
      arts.addAll(newArts);
      page++;
      erro = null;
    } catch (e) {
      erro = e;
    }
  }

  @action
  Future<void> downloadArt(String url, String name) async {
    try {
      setNullInErro();
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
    exist = await File(await path).exists();
  }

  @action
  void setExistForced() => exist = true;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  bool loadingSave = false;

  @action
  Future<void> saveArt(File file) async {
    try {
      setNullInErro();
      loadingSave = true;
      await ArtRepository().postArt(file);
      loadingSave = false;
    } catch (e) {
      erro = e;
      loadingSave = false;
    }
  }

  @observable
  int page = 0;

  @action
  void nextPage() => page++;

  @observable
  bool lastArt = false;

  @action
  void setNullInErro() => erro = null;
}
