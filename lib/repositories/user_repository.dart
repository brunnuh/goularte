import 'dart:io';

import 'package:goularte/models/user.dart';
import 'package:goularte/repositories/parse_errors.dart';
import 'package:goularte/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:path/path.dart' as path;

class UserRepository {
  Future login(User user) async {
    final parseUser = ParseUser(user.email, user.password, user.email);
    final response = await parseUser.login();

    if (response.success) {
      return User.fromJson(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  Future<User> verifyToken() async {
    final ParseUser parseUser = await ParseUser.currentUser();

    if (parseUser != null) {
      final response =
          await ParseUser.getCurrentUserFromServer(parseUser.sessionToken);
      if (response.success) {
        return User.fromJson(response.result);
      } else {
        await parseUser.logout();
      }
    }
    return null;
  }

  Future uploadPhoto(File photo) async {
    final ParseFile file = ParseFile(photo, name: path.basename(photo.path));
    final ParseUser parseUser = await ParseUser.currentUser();

    parseUser.set<ParseFile>(keyUserPhoto, file);
    final response = await parseUser.save();

    if (response.success) {
      return User.fromJson(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  Future<void> logout() async {
    final ParseUser parseUser = await ParseUser.currentUser();
    await parseUser.logout();
  }
}
