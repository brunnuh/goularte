import 'package:goularte/models/ideas.dart';
import 'package:goularte/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class IdeasRepository {
  Future<List<Ideas>> getAllIdeas() async {
    List<Ideas> ideas = [];

    final query = QueryBuilder(ParseObject(keyIdeas));

    //regras
    query.whereEqualTo(keyIdeasAccepted, true);
    //query.orderByDescending(keyIdeasLikes);
    query.includeObject([keyIdeasUser]);
    //query.setLimit(20);

    try {
      var response = await query.query();
      if (response.success) {
        response.results.forEach((i) {
          Ideas idea = Ideas.fromParse(i);
          ideas.add(idea);
        });
      }
      return ideas;
    } catch (e) {
      return Future.error("Falha ao buscar lista de ideias");
    }
  }

  Future<List<Ideas>> getTopIdeas() async {
    List<Ideas> ideas = [];
    final query = QueryBuilder(ParseObject(keyIdeas));

    //regras
    query.whereEqualTo(keyIdeasAccepted, true);
    query.orderByDescending(keyIdeasCreatedAt);
    query.includeObject([keyIdeasUser]);
    query.setLimit(3);

    try {
      var response = await query.query();
      if (response.success) {
        response.results.forEach((i) {
          Ideas idea = Ideas.fromParse(i);
          ideas.add(idea);
        });
      }

      return ideas;
    } catch (e) {
      return Future.error("Falha ao buscar top ideias");
    }
  }
}
