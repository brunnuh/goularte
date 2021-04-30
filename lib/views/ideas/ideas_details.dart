import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:goularte/controllers/ideas_controller.dart';
import 'package:goularte/controllers/login_controller.dart';
import 'package:goularte/helpers/extensions.dart';
import 'package:goularte/models/ideas.dart';
import 'package:goularte/views/globals/alert_widget.dart';
import 'package:goularte/views/globals/loading.dart';
import 'package:line_icons/line_icons.dart';

class IdeasDetails extends StatelessWidget {
  final Ideas idea;
  final ideaController = GetIt.I<IdeasController>();
  final loginController = GetIt.I<LoginController>();

  IdeasDetails({@required this.idea});

  showButtonLike() {
    if (loginController.user != null &&
            idea.already_voted?.contains(loginController.user.objectId) ||
        idea.objectId == loginController.user.objectId ||
        idea.user.objectId == loginController.user.objectId) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).appBarTheme.color,
        actions: [
          Observer(builder: (_) {
            if (ideaController.loadingAll) {
              // se loading estiver ativado
              return Center(
                child: Container(
                    width: 15,
                    height: 15,
                    margin: EdgeInsets.only(right: 10),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    )),
              );
            } else if (loginController.user == null) {
              // se nao estiver logado
              return Container();
            } else if (showButtonLike()) {
              return Container();
            } else if (loginController.user != null) {
              return IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () async {
                  await ideaController.likeIdea(idea);
                  if (ideaController.erro != null) {
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertWidget(
                            content: ideaController.erro,
                            icon: Icon(
                              LineIcons.exclamationCircle,
                              size: 50,
                              color: Colors.redAccent,
                            ),
                            actions: [
                              FlatButton(
                                onPressed: () {
                                  ideaController.clearFields();
                                  Navigator.of(context).pop();
                                },
                                child: Text("ok"),
                              )
                            ]);
                      },
                    );
                  }
                },
              );
            } else {
              return Container();
            }
          }),
        ],
      ),
      body: Observer(
        builder: (_) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Hero(
                      tag: idea.objectId,
                      child: Center(
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(300),
                            color: Colors.purple,
                          ),
                          child: CachedNetworkImage(
                            imageUrl: idea.user.photo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        idea.user.name,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      idea.description,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Em ${idea.createdAt.formattedDate()}",
                          style: TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              idea.likes.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Icon(Icons.favorite_border),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ideaController.loadingAll ? Loading() : Container()
            ],
          );
        },
      ),
    );
  }
}
