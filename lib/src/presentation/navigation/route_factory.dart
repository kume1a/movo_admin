import 'package:flutter/material.dart';

import '../pages/devices/devices_page.dart';
import 'routes.dart';

Route<dynamic>? routeFactory(RouteSettings settings) {
  switch (settings.name) {
    case Routes.root:
      return _createRootPageRoute(settings);
    default:
      throw Exception('route ${settings.name} is not supported');
  }
}

Route<void> _createRootPageRoute(RouteSettings settings) {
  return MaterialPageRoute<void>(
    builder: (_) => const DevicesPage(),
    settings: settings,
  );
}
