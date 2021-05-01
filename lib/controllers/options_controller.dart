import 'package:goularte/repositories/shared_preference.dart';
import 'package:mobx/mobx.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

part 'options_controller.g.dart';

class OptionsController = _OptionsController with _$OptionsController;

abstract class _OptionsController with Store {
  _OptionsController() {
    getValueNotification();
  }

  @observable
  bool changeNotification = false;

  @action
  Future<void> setChangeNotification(bool value) async {
    changeNotification = value;
    await SharedPreference().postValueNotification(value);
  }

  @action
  Future<void> getValueNotification() async {
    changeNotification = await SharedPreference().getValueNotification();
    if (changeNotification != null)
      await OneSignal.shared.setSubscription(changeNotification);
  }
}
