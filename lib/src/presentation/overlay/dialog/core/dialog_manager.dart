import 'package:global_navigator/global_navigator.dart';
import 'package:injectable/injectable.dart';

import '../confirmation_dialog.dart';
import '../name_field_dialog/name_field_dialog.dart';

@lazySingleton
class DialogManager {
  Future<bool> showConfirmationDialog({
    required String caption,
  }) async {
    final bool? didConfirm = await GlobalNavigator.dialog<bool>(
      ConfirmationDialog(caption: caption),
    );

    return didConfirm ?? false;
  }

  Future<String?> showNameFieldDialog() async => GlobalNavigator.dialog(const NameFieldDialog());
}
