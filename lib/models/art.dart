import 'package:goularte/models/user.dart';
import 'package:goularte/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Art {
  User user;
  DateTime createdAt;
  ParseFile image;

  Art({this.user, this.createdAt, this.image});

  factory Art.fromJson(ParseObject parse) {
    return Art(
        user: User.fromJson(parse.get<ParseUser>(keyArtUser)),
        createdAt: parse.get<DateTime>(keyCreatedAt),
        image: parse.get<ParseFile>(keyArtImage));
  }
}
