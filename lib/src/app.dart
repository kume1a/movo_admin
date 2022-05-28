import 'package:flutter/material.dart';

import 'presentation/i18n/app_locales.dart';
import 'presentation/navigation/navigator_key_holder.dart';
import 'presentation/navigation/route_factory.dart';
import 'presentation/navigation/routes.dart';
import 'presentation/values/app_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movo admin',
      locale: AppLocales.localeEn,
      localizationsDelegates: AppLocales.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: Routes.root,
      navigatorKey: NavigatorKeyHolder.navigatorKey,
      onGenerateRoute: routeFactory,
    );
  }
}
