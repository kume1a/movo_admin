import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common_models/common_models.dart';
import 'package:common_utilities/common_utilities.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/device.dart';
import '../../domain/repository/device_repository.dart';

@LazySingleton(as: DeviceRepository)
class DeviceRepositoryImpl implements DeviceRepository {
  DeviceRepositoryImpl(
    this._firestore,
  );

  final FirebaseFirestore _firestore;

  @override
  Future<Either<FetchFailure, List<Device>>> getDevices() async {
    final QuerySnapshot<Map<String, dynamic>> documents =
        await _firestore.collection('authorization_requests').get();

    final List<Device> devices =
        documents.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> e) {
      return Device(
        deviceId: cast(e.get('device_id')) ?? '',
        isAuthorized: cast(e.get('is_authorized')) ?? false,
      );
    }).toList();

    return right(devices);
  }
}
