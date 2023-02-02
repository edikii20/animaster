import 'package:hive/hive.dart';

import '../../entities/cloud_firestore_collection_last_update.dart';

class BoxManager {
  static final instance = BoxManager._();

  BoxManager._();

  Future<Box<CloudFirestoreCollectionLastUpdate>>
      openCollectionsLastUpdateBox() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(CloudFirestoreCollectionLastUpdateAdapter());
    }
    return Hive.openBox<CloudFirestoreCollectionLastUpdate>(
        'collections_last_update');
  }

  Future<void> closeBox(Box box) async {
    await box.compact();
    await box.close();
  }
}
