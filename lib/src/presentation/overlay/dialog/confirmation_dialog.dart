import 'package:flutter/material.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../i18n/translation_keys.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    Key? key,
    required this.caption,
    this.positiveLabel,
    this.negativeLabel,
  }) : super(key: key);

  final String caption;
  final String? positiveLabel;
  final String? negativeLabel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              caption,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text(negativeLabel ?? TkCommon.cancel.i18n),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text(positiveLabel ?? TkCommon.confirm.i18n),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
