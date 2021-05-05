import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/base_controller.dart';
import 'package:goularte/views/base/components/withou_internet.dart';
import 'package:mobx/mobx.dart';

import 'components/with_internet.dart';

class BaseView extends StatefulWidget {
  int page;
  BaseView({this.page = 1});
  @override
  _BaseViewState createState() => _BaseViewState(page: page);
}

class _BaseViewState extends State<BaseView> {
  int page;
  _BaseViewState({this.page = 1})
      : pageController = PageController(initialPage: page);
  final BaseController baseController = GetIt.I<BaseController>();

  PageController pageController;

  StreamSubscription<ConnectivityResult> result;

  @override
  void initState() {
    super.initState();
    reaction(
      (_) => baseController.page,
      (int page) {
        pageController.jumpToPage(page);
      },
    );
    result = Connectivity().onConnectivityChanged.listen(statusNet);
  }

  void statusNet(ConnectivityResult result) {
    if (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile) {
      baseController.setStatusInternet(true);
    } else {
      baseController.setStatusInternet(false);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    result.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return baseController.noInternet
            ? WithInternet(
                baseController: baseController,
                pageController: pageController,
              )
            : WithoutInternet();
      },
    );
  }
}
