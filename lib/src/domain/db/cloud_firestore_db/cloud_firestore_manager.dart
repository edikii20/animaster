import 'package:aniquiz/src/domain/db/hive_db/box_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../entities/cloud_firestore_collection_last_update.dart';

abstract class CloudFirestoreManager {
  static final FirebaseFirestore instance = FirebaseFirestore.instance;

  //TODO: Можно улучшить с помощью добавления lastVisibleDocument
  //TODO: Сабколлекции нужно ГЕТИТЬ ОТДЕЛЬНО И ТАКЖЕ СМОТРЕТЬ ИЗМЕНИЛИСЬ ОНИ ИЛИ НЕТ
  static Future<void> updateCollectionCache({
    required CollectionReference<Map<String, dynamic>> collection,
  }) async {
    print('-------------------- Начал UPDATE --------------------');
    final collectionsLastUpdateBox =
        await BoxManager.instance.openCollectionsLastUpdateBox();

    await collection
        .orderBy('lastUpdate', descending: true)
        .where(
          'lastUpdate',
          isGreaterThan: collectionsLastUpdateBox
                  .get(collection.id)
                  ?.collectionLastUpdate ??
              Timestamp(0, 0),
        )
        .get()
        .then((response) async {
      print('Обновил = ${response.size}');
      if (response.docs.isNotEmpty) {
        await collectionsLastUpdateBox.put(
          collection.id,
          CloudFirestoreCollectionLastUpdate(
            collectionLastUpdate:
                response.docs.first.data()['lastUpdate'] as Timestamp,
          ),
        );
      }
    });
    await BoxManager.instance.closeBox(collectionsLastUpdateBox);
    print('-------------------- Закончил UPDATE --------------------');
  }

  static Future<void> deleteDocument(
      {required DocumentReference<Map<String, dynamic>> doc}) async {
    await doc.update({
      'deleted': true,
      'lastUpdate': FieldValue.serverTimestamp(),
    });
  }
}
