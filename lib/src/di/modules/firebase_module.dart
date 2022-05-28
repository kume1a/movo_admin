import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseModule {
  @lazySingleton
  FirebaseFirestore get firestore {
    final FirebaseFirestore instance = FirebaseFirestore.instance;
    instance.settings = const Settings(persistenceEnabled: false);
    return instance;
  }
}
