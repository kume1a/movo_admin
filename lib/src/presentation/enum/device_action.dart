import 'package:static_i18n/static_i18n.dart';

import '../i18n/translation_keys.dart';

enum DeviceAction {
  delete,
  deactivate,
  activate,
  changeName;

  String translate() {
    switch (this) {
      case DeviceAction.delete:
        return TkEnum.deviceAction.delete.i18n;
      case DeviceAction.deactivate:
        return TkEnum.deviceAction.deactivate.i18n;
      case DeviceAction.activate:
        return TkEnum.deviceAction.activate.i18n;
      case DeviceAction.changeName:
        return TkEnum.deviceAction.changeName.i18n;
    }
  }
}
