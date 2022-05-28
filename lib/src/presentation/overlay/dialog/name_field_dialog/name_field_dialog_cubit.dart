import 'package:common_models/common_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../navigation/page_navigator.dart';

part 'name_field_dialog_cubit.freezed.dart';

@freezed
class NameFieldDialogState with _$NameFieldDialogState {
  const factory NameFieldDialogState({
    required Name name,
    required bool validateForm,
  }) = _NameFieldDialogState;

  factory NameFieldDialogState.initial() => NameFieldDialogState(
        name: Name.empty(),
        validateForm: false,
      );
}

@injectable
class NameFieldDialogCubit extends Cubit<NameFieldDialogState> {
  NameFieldDialogCubit(
    this._pageNavigator,
  ) : super(NameFieldDialogState.initial());

  final PageNavigator _pageNavigator;

  void onNameChanged(String value) => emit(state.copyWith(name: Name(value)));

  void onConfirmPressed() {
    if (!state.name.isValid) {
      return;
    }

    _pageNavigator.pop(result: state.name.getOrThrow);
  }

  void onCancelPressed() => _pageNavigator.pop();
}
