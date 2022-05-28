import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection_config.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => $initGetIt(getIt);
