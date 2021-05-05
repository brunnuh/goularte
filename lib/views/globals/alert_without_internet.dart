import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class AlertWithoutInternet extends StatelessWidget {
  Future<bool> statusNet() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
