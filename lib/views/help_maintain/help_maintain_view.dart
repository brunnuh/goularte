import 'package:flutter/material.dart';

class HelpMaintainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Theme.of(context).appBarTheme.color),
      ),
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Nada é de graça, não é verdade?"),
              Text(
                  "Me ajude a manter o servidor e o aplicativos online e sempre atualizados.")
            ],
          ),
        ),
      ),
    );
  }
}
