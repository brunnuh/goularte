import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/base_controller.dart';

class CardButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final BaseController baseController = GetIt.I<BaseController>();
  final int page;

  CardButton({
    this.icon = Icons.scanner_sharp,
    this.size = 25,
    @required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height,
      child: Observer(
        builder: (_) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            color: baseController.page == page ? Colors.grey.shade200 : null,
            elevation: 0,
            child: IconButton(
              icon: Icon(
                icon,
                color: Theme.of(context).appBarTheme.color,
                size: size,
              ),
              onPressed: () => baseController.setPage(page),
            ),
          );
        },
      ),
    );
  }
}
