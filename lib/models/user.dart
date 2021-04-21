import 'package:goularte/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class User {
  String name;
  String email;
  String password;
  String photo;
  String objectId;

  User({this.name, this.password, this.email, this.photo, this.objectId});

  factory User.fromJson(ParseUser parseUser) {
    // por de fromjson para fromparse
    return User(
      objectId: parseUser.objectId,
      name: parseUser.username,
      email: parseUser.emailAddress,
      photo: parseUser.get<ParseFile>(keyUserPhoto)?.url,
    );
  }

  @override
  String toString() {
    return 'User{name: $name, email: $email, password: $password, photo: $photo, $objectId}';
  }
}
