import 'package:goularte/repositories/table_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  int maxSubmitted = 2;

  // notifications
  /// habilita/desabilita notificacoes
  Future postValueNotification(bool value) async {
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setBool(keyNotification, value);
  }

  // verifica se esta habilitado/desabilitado notificacoes
  Future<bool> getValueNotification() async {
    final sharedPreference = await SharedPreferences.getInstance();
    return sharedPreference.get(keyNotification);
  }

  // submitted ideas
  /// soma mais um no numero de ideias maximo
  Future amountSubmittedIdeas({bool reset = false}) async {
    final sharedPreference = await SharedPreferences.getInstance();
    int amount;
    if (reset) {
      amount = 0;
    } else {
      amount = await _getAmountSubmitted(sharedPreference) + 1;
    }

    if (amount > maxSubmitted) {
      return false;
    } else if (amount == maxSubmitted) {
      DateTime dateTime = DateTime.now();
      sharedPreference.setString(
          keyLastDateSubmittedIdeas, dateTime.toString());
    }
    sharedPreference.setInt(keyTimesSubmittedIdeas, amount);
    return true;
  }

  /// pega o numero max de ideias ja feitos
  Future<int> _getAmountSubmitted(sharedPreference) async {
    int amount = sharedPreference.getInt(keyTimesSubmittedIdeas);
    if (amount != null) {
      return amount;
    }
    return 0;
  }

  /// verifica se ja passou um dia
  Future<bool> isAnotherDay() async {
    final sharedPreference = await SharedPreferences.getInstance();
    String dateTimeCache =
        sharedPreference.getString(keyLastDateSubmittedIdeas);

    if (dateTimeCache != null) {
      DateTime lastDaySubmitted = DateTime.parse(dateTimeCache);

      // se a diferenca entre as horas for maior ou igual a zero, entao ja se passou 24 hrs
      if (DateTime.now().difference(lastDaySubmitted) >= Duration(hours: 24)) {
        return true;
      }
    }

    return false;
  }
}
