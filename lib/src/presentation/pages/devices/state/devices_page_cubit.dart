import 'package:common_models/common_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/device.dart';
import '../../../../domain/repository/device_repository.dart';
import '../../../enum/device_action.dart';
import '../../../notifiers/failure_notifier/simple_action_failure_notifier.dart';
import '../../../overlay/bottom_sheet/core/bottom_sheet_manager.dart';
import '../../../overlay/dialog/core/dialog_manager.dart';

@injectable
class DevicesPageCubit extends Cubit<DataState<FetchFailure, List<Device>>> {
  DevicesPageCubit(
    this._deviceRepository,
    this._bottomSheetManager,
    this._dialogManager,
    this._simpleActionFailureNotifier,
  ) : super(DataState<FetchFailure, List<Device>>.idle());

  final DeviceRepository _deviceRepository;
  final BottomSheetManager _bottomSheetManager;
  final DialogManager _dialogManager;
  final SimpleActionFailureNotifier _simpleActionFailureNotifier;

  void init() => _getDevices();

  Future<void> onDevicePress(Device device) async {
    final DeviceAction? selectedOption = await _bottomSheetManager.showOptionSelector<DeviceAction>(
      options: <DeviceAction>[
        if (device.isAuthorized) DeviceAction.deactivate else DeviceAction.activate,
        DeviceAction.changeName,
        DeviceAction.delete,
      ],
      toStringMapper: (DeviceAction option) => option.translate(),
    );
    if (selectedOption == null) {
      return;
    }

    final Either<SimpleActionFailure, Unit> result;
    switch (selectedOption) {
      case DeviceAction.delete:
        result = await _deviceRepository.deleteDevice(deviceId: device.deviceId);
        break;
      case DeviceAction.deactivate:
        result = await _deviceRepository.deactivateDevice(deviceId: device.deviceId);
        break;
      case DeviceAction.activate:
        result = await _deviceRepository.activateDevice(deviceId: device.deviceId);
        break;
      case DeviceAction.changeName:
        final String? newName = await _dialogManager.showNameFieldDialog();
        if (newName == null) {
          return;
        }

        result = await _deviceRepository.changeDeviceName(
          deviceId: device.deviceId,
          newName: newName,
        );
        break;
    }

    result.fold(
      _simpleActionFailureNotifier.notify,
      (_) => _getDevices(),
    );
  }

  Future<void> _getDevices() async {
    emit(DataState<FetchFailure, List<Device>>.loading());
    final Either<FetchFailure, List<Device>> result = await _deviceRepository.getDevices();
    emit(DataState<FetchFailure, List<Device>>.fromEither(result));
  }
}
