import 'package:common_models/common_models.dart';
import 'package:common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../../di/injection_config.dart';
import '../../../i18n/translation_keys.dart';
import 'name_field_dialog_cubit.dart';

class NameFieldDialog extends StatelessWidget {
  const NameFieldDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NameFieldDialogCubit>(
      create: (_) => getIt<NameFieldDialogCubit>(),
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return TapOutsideToClearFocus(
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                TkNameFieldDialog.header.i18n,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              BlocBuilder<NameFieldDialogCubit, NameFieldDialogState>(
                buildWhen: (NameFieldDialogState previous, NameFieldDialogState current) =>
                    previous.validateForm != current.validateForm,
                builder: (_, NameFieldDialogState state) {
                  return ValidatedForm(
                    showErrors: state.validateForm,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      maxLength: 256,
                      decoration: InputDecoration(
                        hintText: TkFieldHint.name.i18n,
                        counterText: '',
                      ),
                      onChanged: context.read<NameFieldDialogCubit>().onNameChanged,
                      validator: (_) => context.read<NameFieldDialogCubit>().state.name.value.fold(
                            (NameFailure l) => l.when(
                              empty: () => TkValidationError.fieldIsRequired.i18n,
                              tooShort: () => TkValidationError.nameIsTooShort.i18n,
                            ),
                            (_) => null,
                          ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextButton(
                      onPressed: context.read<NameFieldDialogCubit>().onCancelPressed,
                      child: Text(TkCommon.cancel.i18n),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextButton(
                      onPressed: context.read<NameFieldDialogCubit>().onConfirmPressed,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(theme.colorScheme.secondary),
                        overlayColor: MaterialStateProperty.all(Colors.white10),
                      ),
                      child: Text(TkCommon.confirm.i18n),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
