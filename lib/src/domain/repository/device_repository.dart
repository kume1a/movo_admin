import 'package:common_models/common_models.dart';

import '../model/device.dart';

abstract class DeviceRepository {
  Future<Either<FetchFailure, List<Device>>> getDevices();
}
