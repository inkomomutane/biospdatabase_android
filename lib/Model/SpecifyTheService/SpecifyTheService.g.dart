// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SpecifyTheService.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpecifyTheServiceAdapter extends TypeAdapter<SpecifyTheService> {
  @override
  final int typeId = 11;

  @override
  SpecifyTheService read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpecifyTheService(
      benificiaryUuid: fields[2] as String,
      forwardedServiceUuid: fields[3] as String,
      specifyTheService: fields[4] as String,
      uuid: fields[1] as String,
      createdAt: fields[5] as DateTime,
      updatedAt: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SpecifyTheService obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.uuid)
      ..writeByte(2)
      ..write(obj.benificiaryUuid)
      ..writeByte(3)
      ..write(obj.forwardedServiceUuid)
      ..writeByte(4)
      ..write(obj.specifyTheService)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpecifyTheServiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecifyTheService _$SpecifyTheServiceFromJson(Map<String, dynamic> json) {
  return SpecifyTheService(
    benificiaryUuid: json['benificiary_uuid'] as String,
    forwardedServiceUuid: json['forwarded_service_uuid'] as String,
    specifyTheService: json['specify_the_service'] as String,
    uuid: json['uuid'] as String,
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['update_at'] as String),
  );
}

Map<String, dynamic> _$SpecifyTheServiceToJson(SpecifyTheService instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'benificiary_uuid': instance.benificiaryUuid,
      'forwarded_service_uuid': instance.forwardedServiceUuid,
      'specify_the_service': instance.specifyTheService,
      'created_at': instance.createdAt.toIso8601String(),
      'update_at': instance.updatedAt.toIso8601String(),
    };
