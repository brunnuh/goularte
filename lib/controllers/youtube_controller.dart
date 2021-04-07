import 'package:goularte/repositories/youtube_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

part 'youtube_controller.g.dart';

class YoutubeController = _YoutubeController with _$YoutubeController;

abstract class _YoutubeController with Store {
  _YoutubeController() {
    _getVideos();
  }

  ObservableList ytVideos = ObservableList();

  @observable
  String error;

  @action
  Future<void> _getVideos() async {
    try {
      final SearchList vd = await YoutubeRepository().getVideos();

      vd.forEach((videos) {
        if (videos.author.toLowerCase() == "goularte") ytVideos.add(videos);
      });
    } catch (e) {
      error = e;
    }
  }
}
