// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Provenace.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProvenaceAdapter extends TypeAdapter<Provenace> {
  @override
  final int typeId = 6;

  @override
  Provenace read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Provenace(
      uuid: fields[0] as String,
      name: fields[1] as String,
      createdAt: fields[2] as DateTime?,
      updatedAt: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Provenace obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProvenaceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Provenace _$ProvenaceFromJson(Map<String, dynamic> json) {
  return Provenace(
    uuid: json['uuid'] as String,
    name: json['name'] as String,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$ProvenaceToJson(Provenace instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
