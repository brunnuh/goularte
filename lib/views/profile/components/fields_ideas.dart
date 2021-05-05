import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/ideas_controller.dart';
import 'package:goularte/views/globals/loading.dart';

class FieldsIdeas extends StatelessWidget {
  IdeasController ideasController = GetIt.I<IdeasController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).appBarTheme.color,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  ideasController.clearFields();
                },
              ),
            ),
            body: Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Qual sua ideia?",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Observer(builder: (_) {
                          return TextFormField(
                            onChanged: ideasController.setDescription,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              errorText: ideasController.erroField,
                            ),
                            maxLines: 7,
                            readOnly: ideasController.loadingAll,
                            minLines: 4,
                            autofocus: true,
                            //maxLength: ideasController.length,
                            //maxLengthEnforced: true,
                            autocorrect: true,
                          );
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Observer(
                            builder: (_) {
                              return RaisedButton(
                                child: Text(
                                  "Enviar",
                                  style: TextStyle(
                                    color: ideasController.onButton
                                        ? Colors.white
                                        : Colors.white60,
                                    fontSize: 18,
                                  ),
                                ),
                                color: ideasController.onButton
                                    ? Theme.of(context).appBarTheme.color
                                    : Colors.blueGrey,
                                onPressed: () =>
                                    ideasController.onPressedSubmitted(context),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          ideasController.loadingAll ? Loading() : Container()
        ],
      );
    });
  }
}
