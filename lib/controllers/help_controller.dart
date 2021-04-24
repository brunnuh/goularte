import 'package:mobx/mobx.dart';

part 'help_controller.g.dart';

class HelpController = _HelpController with _$HelpController;

abstract class _HelpController with Store {
  @observable
  bool msgCopy = false;

  @action
  void setMsgCopy() => msgCopy = !msgCopy;
}
