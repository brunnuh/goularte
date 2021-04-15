import 'package:goularte/models/art.dart';
import 'package:goularte/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ArtRepository {
  Future<List<Art>> getArts() async {
    List<Art> arts = [];

    final queryBuilder = QueryBuilder<ParseObject>(ParseObject(keyArts));

    //queryBuilder.setLimit(20);
    queryBuilder.orderByAscending(keyCreatedAt);

    queryBuilder.includeObject([keyArtUser]);

    try {
      final response = await queryBuilder.query();
      if (response.success) {
        response.result.forEach((ParseObject e) {
          arts.add(Art.fromJson(e));
        });
        return arts;
      }
      return [];
    } catch (e) {
      return Future.error('Falha ao buscar artes');
    }
  }
}
