import 'package:global_navigator/global_navigator.dart';
import 'package:injectable/injectable.dart';

import '../option_selector_bs.dart';

@lazySingleton
class BottomSheetManager {
  Future<T?> showOptionSelector<T extends Object?>({
    required List<T> options,
    required String Function(T option) toStringMapper,
    String? header,
  }) async {
    return GlobalNavigator.bottomSheet(OptionSelectorBS<T>(
      options: options,
      toStringMapper: toStringMapper,
      header: header,
    ));
  }
}
