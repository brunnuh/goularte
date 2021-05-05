import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goularte/models/ideas.dart';
import 'package:goularte/repositories/ideas_repository.dart';
import 'package:goularte/repositories/shared_preference.dart';
import 'package:goularte/views/globals/alert_widget.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mobx/mobx.dart';

part 'ideas_controller.g.dart';

class IdeasController = _IdeasController with _$IdeasController;

abstract class _IdeasController with Store {
  _IdeasController() {
    if (page == 0) {
      loadingAll = true;
    }
    autorun((_) async {
      try {
        List<Ideas> newIdeas = await IdeasRepository().getIdeas(page);
        addNewsIdeas(newIdeas);
      } catch (e) {
        lastPage = true;
      }
      await getTopIdeas();
      loadingAll = false;
    });
  }
  ObservableList<Ideas> ideasList = ObservableList<Ideas>();

  @observable
  String erro;

  @observable
  bool loadingAll = false;

  @observable
  bool loadingTop = false;

  @observable
  int page = 0;

  @action
  void nextPage() => page++;

  ObservableList<Ideas> topIdeas = ObservableList<Ideas>();

  @action
  Future<void> getTopIdeas() async {
    try {
      loadingTop = true;
      topIdeas.clear();
      List<Ideas> ideas = await IdeasRepository().getTopIdeas();
      topIdeas.addAll(ideas);
      loadingTop = false;
    } catch (e) {
      loadingTop = false;
      loadingAll = false;
      erro = e;
    }
  }

  @action
  Future<void> getAllIdeas() async {
    try {
      loadingAll = true;
      await getTopIdeas();
      List<Ideas> newIdeas = await IdeasRepository().getIdeas(page);
      ideasList.clear();
      ideasList.addAll(newIdeas);
      page = 0;
      lastPage = false;
    } catch (e) {
      loadingTop = false;
      loadingAll = false;
      erro = e;
    }
  }

  @action
  Future<void> likeIdea(Ideas idea) async {
    try {
      loadingAll = true;
      //erro = null;
      List updateIdea = await IdeasRepository().likeIdea(idea);
      ideasList.remove(idea);
      idea.likes = updateIdea.last;
      idea.already_voted = updateIdea.first;
      ideasList.add(idea);
      loadingAll = false;
    } catch (e) {
      loadingAll = false;
      erro = e;
    }
  }

  @observable
  String description;

  @observable
  bool response;

  int length = 250;

  @action
  void setDescription(String value) => description = value;

  @action
  Future<void> postIdea() async {
    try {
      erro = null;
      loadingAll = true;
      bool canSend = await SharedPreference().amountSubmittedIdeas();

      if (canSend) {
        response = await IdeasRepository().postIdea(description);
      } else {
        erro =
            "Limite maximo de ideias que podem ser enviadas por dia atigindo";
      }
    } catch (e) {
      erro = e;
    }
    loadingAll = false;
  }

  @action
  void clearFields() {
    erro = null;
    response = null;
    description = null;
  }

  @computed
  bool get validField =>
      description != null && description != "" && description.length > length;
  @computed
  bool get onButton =>
      description != null &&
      description.isNotEmpty &&
      description != "" &&
      description.replaceAll(" ", "") != "" &&
      description.length <= length;

  @computed
  String get erroField {
    if (validField) {
      return "Texto muito grande";
    } else if (description != null && description.isEmpty) {
      return "Digite algo";
    }
  }

  @observable
  bool lastPage = false;

  @action
  void addNewsIdeas(List<Ideas> newIdeas) {
    if (newIdeas.length < IdeasRepository().limit) {
      lastPage = true;
    }
    ideasList.addAll(newIdeas);
  }

  @computed
  int get countListIdeas => lastPage ? ideasList.length : ideasList.length + 1;

  @action
  Future<Widget> onPressedSubmitted(BuildContext context) async {
    if (onButton) {
      await postIdea();
      setDescription("");
      Navigator.of(context).pop();
      if (response != null && response) {
        return showDialog(
          context: context,
          builder: (context) {
            return AlertWidget(
              content: "Aguarde a ideia ser liberada",
              icon: Icon(
                LineIcons.check,
                color: Colors.green,
                size: 60,
              ),
              actions: [
                FlatButton(
                  onPressed: () {
                    clearFields();
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok"),
                )
              ],
            );
          },
        );
      } else if (erro != null) {
        return showDialog(
            context: context,
            builder: (context) {
              return AlertWidget(
                content: erro,
                icon: Icon(LineIcons.exclamationCircle, color: Colors.red),
                actions: [
                  FlatButton(
                    onPressed: () {
                      clearFields();
                      Navigator.of(context).pop();
                    },
                    child: Text("Ok"),
                  )
                ],
              );
            });
      } else {
        return showDialog(
          context: context,
          builder: (context) {
            return AlertWidget(
              content: "Falha ao tentar enviar, por favor tente mais tarde.",
              icon: Icon(
                LineIcons.exclamationCircle,
                color: Colors.red,
                size: 60,
              ),
              actions: [
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Ok"),
                ),
              ],
            );
          },
        );
      }
    } else {
      return Container();
    }
  }
}
