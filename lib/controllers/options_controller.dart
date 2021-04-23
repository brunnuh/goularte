import 'package:mobx/mobx.dart';

part 'options_controller.g.dart';

class OptionsController = _OptionsController with _$OptionsController;

abstract class _OptionsController with Store {
  @observable
  bool changeNotificationYoutube = false;

  @action
  void setChangeNotificationYoutube(bool value) {
    changeNotificationYoutube = value;
  }

  @observable
  bool changeNotificationTwitch = false;

  @action
  void setChangeNotificationTwitch(bool value) {
    changeNotificationTwitch = value;
  }
}
