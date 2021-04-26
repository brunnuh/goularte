import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashController with _$SplashController;

abstract class _SplashController with Store {
  _SplashController() {
    setLoading(true);
  }
  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;
}
