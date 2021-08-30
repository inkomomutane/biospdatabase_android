// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SpecifyThePropose.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpecifyTheProposeAdapter extends TypeAdapter<SpecifyThePropose> {
  @override
  final int typeId = 10;

  @override
  SpecifyThePropose read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpecifyThePropose(
      purposeOfVisitUuid: fields[1] as String,
      benificiaryUuid: fields[2] as String,
      specifyThePropose: fields[4] as String,
      uuid: fields[0] as String,
      createdAt: fields[5] as DateTime,
      updatedAt: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SpecifyThePropose obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.purposeOfVisitUuid)
      ..writeByte(2)
      ..write(obj.benificiaryUuid)
      ..writeByte(4)
      ..write(obj.specifyThePropose)
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
      other is SpecifyTheProposeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecifyThePropose _$SpecifyTheProposeFromJson(Map<String, dynamic> json) {
  return SpecifyThePropose(
    purposeOfVisitUuid: json['purpose_of_visit_uuid'] as String,
    benificiaryUuid: json['benificiary_uuid'] as String,
    specifyThePropose: json['specify_the_propose'] as String,
    uuid: json['uuid'] as String,
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['update_at'] as String),
  );
}

Map<String, dynamic> _$SpecifyTheProposeToJson(SpecifyThePropose instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'purpose_of_visit_uuid': instance.purposeOfVisitUuid,
      'benificiary_uuid': instance.benificiaryUuid,
      'specify_the_propose': instance.specifyThePropose,
      'created_at': instance.createdAt.toIso8601String(),
      'update_at': instance.updatedAt.toIso8601String(),
    };
