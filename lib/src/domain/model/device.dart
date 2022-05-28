import 'package:freezed_annotation/freezed_annotation.dart';

part 'device.freezed.dart';

@freezed
class Device with _$Device {
  const factory Device({
    required String deviceId,
    required bool isAuthorized,
    required String name,
  }) = _Device;
}
