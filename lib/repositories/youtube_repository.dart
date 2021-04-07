import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YoutubeRepository {
  final YoutubeExplode yt = YoutubeExplode();

  Future<SearchList> getVideos() async {
    try {
      final SearchList result = await yt.search.getVideos('goularte');
      return result;
    } catch (e) {
      return Future.error('Falha na busca dos videos.');
    }
  }
}
