import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:static_i18n/static_i18n.dart';

import 'app_locales.dart';
import 'translation_keys.dart';

@injectable
class AppTranslations extends Translations {
  @override
  Map<Locale, Map<String, String>> get keys => <Locale, Map<String, String>>{
        AppLocales.localeEn: _enUs,
      };

  final Map<String, String> _enUs = <String, String>{
    TkCommon.error: 'Error',
    TkCommon.cancel: 'Cancel',
    TkCommon.confirm: 'Confirm',

    TkError.unknown: 'Unknown error',
    TkError.network: 'Network error',

    TkEnum.deviceAction.delete: 'Delete device',
    TkEnum.deviceAction.activate: 'Activate',
    TkEnum.deviceAction.deactivate: 'Deactivate',
    TkEnum.deviceAction.changeName: 'Change name',

    TkFieldHint.name: 'Name',

    TkValidationError.fieldIsRequired: 'Field is required',
    TkValidationError.nameIsTooShort: 'Name is too short',

    TkNameFieldDialog.header: 'Type name',
  };
}
