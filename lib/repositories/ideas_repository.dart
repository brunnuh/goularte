import 'package:goularte/models/ideas.dart';
import 'package:goularte/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class IdeasRepository {
  int limit = 7;

  Future postIdea(String description) async {
    ParseUser parseUser = await ParseUser.currentUser();
    final parseObject = ParseObject(keyIdeas);

    parseObject.set<String>(keyIdeasDescription, description);
    parseObject.set<ParseUser>(keyIdeasUser, parseUser);

    try {
      final response = await parseObject.save();
      if (response.success) {
        return true;
      }
      return false;
    } catch (e) {
      return Future.error("Falha ao enviar, por favor, tente mais tarde.");
    }
  }

  Future<List<Ideas>> getIdeas(int nextPage) async {
    List<Ideas> ideas = [];

    final query = QueryBuilder(ParseObject(keyIdeas));

    //regras

    //query.whereEqualTo(keyIdeasAccepted, true);
    query.orderByDescending(keyIdeasCreatedAt);
    query.includeObject([keyIdeasUser]);
    query.setLimit(limit);
    query.setAmountToSkip(nextPage * limit);

    try {
      var response = await query.query();
      if (response.success) {
        response.results.forEach((i) async {
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
    //query.whereEqualTo(keyIdeasAccepted, true);
    query.orderByDescending(keyIdeasLikes);
    query.includeObject([keyIdeasUser, keyIdeasAlready_voted]);
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

  Future likeIdea(Ideas idea) async {
    try {
      ParseUser parseUser = await ParseUser.currentUser();
      if (parseUser != null && parseUser.objectId != idea.user.objectId) {
        if (idea.already_voted == null ||
            !idea.already_voted.contains(parseUser.objectId.toString())) {
          ParseObject parseIdea = ParseObject(keyIdeas)
            ..objectId = idea.objectId;
          if (idea.already_voted == null) {
            idea.already_voted = [];
          }
          idea.already_voted.add(parseUser.objectId);
          parseIdea.setIncrement(keyIdeasLikes, 1);
          parseIdea.set<List>(keyIdeasAlready_voted, idea.already_voted);
          final response = await parseIdea.update();
          if (response.success) {
            return [
              idea.already_voted,
              response.result.get<num>(keyIdeasLikes)
            ];
          }
        } else {
          return Future.error("Já foi votado");
        }
      } else {
        return Future.error("O usuario não pode curtir suas proprias ideias.");
      }
    } catch (e) {
      return Future.error("Falha ao curtir");
    }
  }
}
