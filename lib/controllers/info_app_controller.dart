import 'package:mobx/mobx.dart';
import 'package:package_info/package_info.dart';

part 'info_app_controller.g.dart';

class InfoAppController = _InfoAppController with _$InfoAppController;

abstract class _InfoAppController with Store {
  _InfoAppController() {
    _getVersion();
  }

  @observable
  PackageInfo packageInfo;

  @action
  Future<void> _getVersion() async {
    packageInfo = await PackageInfo.fromPlatform();
  }
}
