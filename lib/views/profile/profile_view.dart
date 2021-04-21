import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/login_controller.dart';
import 'package:goularte/views/profile/components/login.dart';
import 'package:goularte/views/profile/components/top_information.dart';

import 'components/options.dart';

class ProfileView extends StatelessWidget {
  LoginController _loginController = GetIt.I<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              'Perfil',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Observer(
            builder: (_) => _loginController.user == null
                ? Center(
                    child: Login(),
                  )
                : TopInformation(),
          ),
          const SizedBox(
            height: 40,
          ),
          const SizedBox(
            height: 10,
          ),
          Options(
              //loginController: _loginController,
              )
        ],
      ),
    ));
  }
}
