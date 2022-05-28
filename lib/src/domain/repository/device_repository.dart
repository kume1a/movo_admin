import 'package:common_models/common_models.dart';

import '../model/device.dart';

abstract class DeviceRepository {
  Future<Either<FetchFailure, List<Device>>> getDevices();

  Future<Either<SimpleActionFailure, Unit>> deleteDevice({
    required String deviceId,
  });

  Future<Either<SimpleActionFailure, Unit>> changeDeviceName({
    required String deviceId,
    required String newName,
  });

  Future<Either<SimpleActionFailure, Unit>> activateDevice({
    required String deviceId,
  });

  Future<Either<SimpleActionFailure, Unit>> deactivateDevice({
    required String deviceId,
  });
}
