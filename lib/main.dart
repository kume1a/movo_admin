import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_navigator/global_navigator.dart';
import 'package:logger/logger.dart';
import 'package:static_i18n/static_i18n.dart';

import 'src/app.dart';
import 'src/di/injection_config.dart';
import 'src/presentation/i18n/app_locales.dart';
import 'src/presentation/i18n/translations.dart';
import 'src/presentation/navigation/navigator_key_holder.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await configureDependencies();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);

  StaticI18N.initialize(
    tr: getIt<AppTranslations>(),
    locale: AppLocales.fallbackLocale,
    fallbackLocale: AppLocales.fallbackLocale,
  );

  GlobalNavigator.navigatorKey = NavigatorKeyHolder.navigatorKey;

  runApp(const App());
}

final Logger logger = Logger();
