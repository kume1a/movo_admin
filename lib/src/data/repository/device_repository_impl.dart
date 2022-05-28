import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:common_models/common_models.dart';
import 'package:common_utilities/common_utilities.dart';
import 'package:injectable/injectable.dart';

import '../../../main.dart';
import '../../domain/model/device.dart';
import '../../domain/repository/device_repository.dart';

@LazySingleton(as: DeviceRepository)
class DeviceRepositoryImpl implements DeviceRepository {
  DeviceRepositoryImpl(
    this._firestore,
  );

  final FirebaseFirestore _firestore;

  static const String _collectionAuthorizationRequests = 'authorization_requests';

  static const String _fieldDeviceId = 'device_id';
  static const String _fieldIsAuthorized = 'is_authorized';
  static const String _fieldName = 'name';

  @override
  Future<Either<FetchFailure, List<Device>>> getDevices() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> documents =
          await _firestore.collection(_collectionAuthorizationRequests).get();

      final List<Device> devices =
          documents.docs.map((QueryDocumentSnapshot<Map<String, dynamic>> e) {
        final Map<String, dynamic> data = e.data();

        return Device(
          deviceId: cast(data[_fieldDeviceId]) ?? '',
          isAuthorized: cast(data[_fieldIsAuthorized]) ?? false,
          name: cast(data[_fieldName]) ?? '',
        );
      }).toList();

      return right(devices);
    } catch (e) {
      logger.e(e);
    }

    return left(FetchFailure.unknown());
  }

  @override
  Future<Either<SimpleActionFailure, Unit>> activateDevice({
    required String deviceId,
  }) async {
    try {
      final QueryDocumentSnapshot<Map<String, dynamic>>? doc = await _getDocRefByDeviceId(deviceId);
      if (doc == null) {
        return left(SimpleActionFailure.unknown());
      }

      await doc.reference.update(<String, Object?>{_fieldIsAuthorized: true});
      return right(unit);
    } catch (e) {
      logger.e(e);
    }

    return left(SimpleActionFailure.unknown());
  }

  @override
  Future<Either<SimpleActionFailure, Unit>> changeDeviceName({
    required String deviceId,
    required String newName,
  }) async {
    try {
      final QueryDocumentSnapshot<Map<String, dynamic>>? doc = await _getDocRefByDeviceId(deviceId);
      if (doc == null) {
        return left(SimpleActionFailure.unknown());
      }

      await doc.reference.update(<String, Object?>{_fieldName: newName});
      return right(unit);
    } catch (e) {
      logger.e(e);
    }

    return left(SimpleActionFailure.unknown());
  }

  @override
  Future<Either<SimpleActionFailure, Unit>> deactivateDevice({
    required String deviceId,
  }) async {
    try {
      final QueryDocumentSnapshot<Map<String, dynamic>>? doc = await _getDocRefByDeviceId(deviceId);
      if (doc == null) {
        return left(SimpleActionFailure.unknown());
      }

      await doc.reference.update(<String, Object?>{_fieldIsAuthorized: false});
      return right(unit);
    } catch (e) {
      logger.e(e);
    }

    return left(SimpleActionFailure.unknown());
  }

  @override
  Future<Either<SimpleActionFailure, Unit>> deleteDevice({
    required String deviceId,
  }) async {
    try {
      final QueryDocumentSnapshot<Map<String, dynamic>>? doc = await _getDocRefByDeviceId(deviceId);
      if (doc == null) {
        return left(SimpleActionFailure.unknown());
      }

      await doc.reference.delete();
      return right(unit);
    } catch (e) {
      logger.e(e);
    }

    return left(SimpleActionFailure.unknown());
  }

  Future<QueryDocumentSnapshot<Map<String, dynamic>>?> _getDocRefByDeviceId(String deviceId) async {
    final QuerySnapshot<Map<String, dynamic>> docs = await _firestore
        .collection(_collectionAuthorizationRequests)
        .where(_fieldDeviceId, isEqualTo: deviceId)
        .get();

    return docs.docs.firstOrNull;
  }
}
