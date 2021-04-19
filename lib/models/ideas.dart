import 'package:goularte/models/user.dart';
import 'package:goularte/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Ideas {
  DateTime createdAt;
  User user;
  String description;
  num likes;

  Ideas({this.user, this.createdAt, this.description, this.likes});

  factory Ideas.fromParse(ParseObject parse) {
    return Ideas(
      user: User.fromJson(parse.get<ParseUser>(keyIdeasUser)),
      createdAt: parse.get<DateTime>(keyIdeasCreatedAt),
      description: parse.get<String>(keyIdeasDescription),
      likes: parse.get<num>(keyIdeasLikes),
    );
  }

  @override
  String toString() {
    return 'Ideas{createdAt: $createdAt, user: $user, description: $description, likes: $likes}';
  }
}
