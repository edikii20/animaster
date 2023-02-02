import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

part 'cloud_firestore_collection_last_update.g.dart';

@HiveType(typeId: 0)
class CloudFirestoreCollectionLastUpdate {
  @HiveField(0)
  final Timestamp collectionLastUpdate;

  CloudFirestoreCollectionLastUpdate({
    required this.collectionLastUpdate,
  });
}
