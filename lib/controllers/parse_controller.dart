import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/login_controller.dart';
import 'package:goularte/models/user.dart';
import 'package:goularte/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'parse_controller.g.dart';

class ParseController = _ParseController with _$ParseController;

abstract class _ParseController with Store {
  @observable
  bool loading = false;

  LoginController loginController = GetIt.I<LoginController>();

  File image;

  @action
  Future<void> uploadPhoto(File file) async {
    loading = true;
    User user = await UserRepository().uploadPhoto(file);
    loginController.setUser(user);
    loading = false;
  }
}
