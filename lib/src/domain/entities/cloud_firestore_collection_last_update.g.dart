// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_firestore_collection_last_update.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CloudFirestoreCollectionLastUpdateAdapter
    extends TypeAdapter<CloudFirestoreCollectionLastUpdate> {
  @override
  final int typeId = 0;

  @override
  CloudFirestoreCollectionLastUpdate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CloudFirestoreCollectionLastUpdate(
      collectionLastUpdate: Timestamp.fromMillisecondsSinceEpoch(fields[0]),
    );
  }

  @override
  void write(BinaryWriter writer, CloudFirestoreCollectionLastUpdate obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.collectionLastUpdate.millisecondsSinceEpoch);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CloudFirestoreCollectionLastUpdateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
