import 'package:goularte/repositories/table_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  Future postValueNotification(bool value) async {
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setBool(keyNotification, value);
  }

  Future<bool> getValueNotification() async {
    final sharedPreference = await SharedPreferences.getInstance();
    return sharedPreference.get(keyNotification);
  }
}
