// ignore_for_file: avoid_field_initializers_in_const_classes

abstract class TkCommon {
  static const String error = 'TkCommon.error';
  static const String cancel = 'TkCommon.cancel';
  static const String confirm = 'TkCommon.confirm';
}

abstract class TkError {
  static const String unknown = 'TkError.unknown';
  static const String network = 'TkError.network';
}

abstract class TkEnum {
  static const _DeviceAction deviceAction = _DeviceAction._();
}

class _DeviceAction {
  const _DeviceAction._();

  final String delete = '_DeviceAction.delete';
  final String activate = '_DeviceAction.activate';
  final String deactivate = '_DeviceAction.deactivate';
  final String changeName = '_DeviceAction.changeName';
}

abstract class TkFieldHint {
  static const String name = 'TkFieldHint.name';
}

abstract class TkValidationError {
  static const String fieldIsRequired = 'TkValidationError.fieldIsRequired';
  static const String nameIsTooShort = 'TkValidationError.nameIsTooShort';
}

abstract class TkNameFieldDialog {
  static const String header = 'TkNameFieldDialog.header';
}
