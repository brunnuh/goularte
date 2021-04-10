import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class User {
  String name;
  String email;
  String password;

  User({this.name, this.password, this.email});

  factory User.fromJson(ParseUser parseUser) {
    return User(
      name: parseUser.username,
      email: parseUser.emailAddress,
    );
  }
}
