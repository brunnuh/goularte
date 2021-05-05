import 'package:mobx/mobx.dart';

part 'base_controller.g.dart';

class BaseController = _BaseController with _$BaseController;

abstract class _BaseController with Store {
  @observable
  int page = 1;

  @observable
  bool noInternet = false;

  @action
  void setPage(int value) => page = value;

  @action
  void setStatusInternet(bool value) => noInternet = value;
}
