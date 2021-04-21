import 'package:goularte/models/user.dart';
import 'package:goularte/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Ideas {
  DateTime createdAt;
  User user;
  String description;
  String objectId;
  num likes;
  List already_voted = [];

  Ideas(
      {this.user,
      this.createdAt,
      this.description,
      this.likes,
      this.objectId,
      this.already_voted});

  factory Ideas.fromParse(ParseObject parse) {
    return Ideas(
      user: User.fromJson(parse.get<ParseUser>(keyIdeasUser)),
      createdAt: parse.get<DateTime>(keyIdeasCreatedAt),
      description: parse.get<String>(keyIdeasDescription),
      likes: parse.get<num>(keyIdeasLikes),
      already_voted: parse.get<List>(keyIdeasAlready_voted),
      objectId: parse.objectId,
    );
  }

  @override
  String toString() {
    return 'Ideas{createdAt: $createdAt, user: $user, description: $description, likes: $likes, objectId: $objectId, already_voted: $already_voted}';
  }
}
