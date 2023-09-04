// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'KnownOfBiosp.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KnownOfBiospAdapter extends TypeAdapter<KnownOfBiosp> {
  @override
  final int typeId = 10;

  @override
  KnownOfBiosp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KnownOfBiosp(
      uuid: fields[0] as String,
      name: fields[1] as String,
      createdAt: fields[2] as DateTime?,
      updatedAt: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, KnownOfBiosp obj) {
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
      other is KnownOfBiospAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnownOfBiosp _$KnownOfBiospFromJson(Map<String, dynamic> json) => KnownOfBiosp(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$KnownOfBiospToJson(KnownOfBiosp instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
