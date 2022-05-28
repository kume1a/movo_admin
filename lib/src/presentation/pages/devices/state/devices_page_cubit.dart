import 'package:common_models/common_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/device.dart';
import '../../../../domain/repository/device_repository.dart';

@injectable
class DevicesPageCubit extends Cubit<DataState<FetchFailure, List<Device>>> {
  DevicesPageCubit(
    this._deviceRepository,
  ) : super(DataState<FetchFailure, List<Device>>.idle());

  final DeviceRepository _deviceRepository;

  void init() => _getDevices();

  Future<void> _getDevices() async {
    emit(DataState<FetchFailure, List<Device>>.loading());
    final Either<FetchFailure, List<Device>> result = await _deviceRepository.getDevices();
    emit(DataState<FetchFailure, List<Device>>.fromEither(result));
  }
}
