// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Benificiary.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BenificiaryAdapter extends TypeAdapter<Benificiary> {
  @override
  final int typeId = 1;

  @override
  Benificiary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Benificiary(
      uuid: fields[0] as String?,
      fullName: fields[1] as String?,
      numberOfVisits: fields[2] as String?,
      birthDate: fields[3] as DateTime?,
      phone: fields[4] as String?,
      serviceDate: fields[5] as DateTime?,
      homeCare: fields[6] as String?,
      purposeOfVisit: fields[7] as String?,
      dateReceived: fields[8] as DateTime?,
      status: fields[9] as bool?,
      neighborhoodUuid: fields[10] as String?,
      genreUuid: fields[11] as String?,
      provenaceUuid: fields[12] as String?,
      reasonOpeningCaseUuid: fields[13] as String?,
      documentTypeUuid: fields[14] as String?,
      createdAt: fields[15] as DateTime,
      updatedAt: fields[16] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Benificiary obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.numberOfVisits)
      ..writeByte(3)
      ..write(obj.birthDate)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.serviceDate)
      ..writeByte(6)
      ..write(obj.homeCare)
      ..writeByte(7)
      ..write(obj.purposeOfVisit)
      ..writeByte(8)
      ..write(obj.dateReceived)
      ..writeByte(9)
      ..write(obj.status)
      ..writeByte(10)
      ..write(obj.neighborhoodUuid)
      ..writeByte(11)
      ..write(obj.genreUuid)
      ..writeByte(12)
      ..write(obj.provenaceUuid)
      ..writeByte(13)
      ..write(obj.reasonOpeningCaseUuid)
      ..writeByte(14)
      ..write(obj.documentTypeUuid)
      ..writeByte(15)
      ..write(obj.createdAt)
      ..writeByte(16)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BenificiaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Benificiary _$BenificiaryFromJson(Map<String, dynamic> json) {
  return Benificiary(
    uuid: json['uuid'] as String?,
    fullName: json['full_name'] as String?,
    numberOfVisits: json['number_of_visits'] as String?,
    birthDate: json['birth_date'] == null
        ? null
        : DateTime.parse(json['birth_date'] as String),
    phone: json['phone'] as String?,
    serviceDate: json['service_date'] == null
        ? null
        : DateTime.parse(json['service_date'] as String),
    homeCare: json['home_care'] as String?,
    purposeOfVisit: json['purpose_of_visit'] as String?,
    dateReceived: json['date_received'] == null
        ? null
        : DateTime.parse(json['date_received'] as String),
    status: json['status'] as bool?,
    neighborhoodUuid: json['neighborhood_uuid'] as String?,
    genreUuid: json['genre_uuid'] as String?,
    provenaceUuid: json['provenace_uuid'] as String?,
    reasonOpeningCaseUuid: json['reason_opening_case_uuid'] as String?,
    documentTypeUuid: json['document_type_uuid'] as String?,
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['update_at'] as String),
  );
}

Map<String, dynamic> _$BenificiaryToJson(Benificiary instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'full_name': instance.fullName,
      'number_of_visits': instance.numberOfVisits,
      'birth_date': instance.birthDate?.toIso8601String(),
      'phone': instance.phone,
      'service_date': instance.serviceDate?.toIso8601String(),
      'home_care': instance.homeCare,
      'purpose_of_visit': instance.purposeOfVisit,
      'date_received': instance.dateReceived?.toIso8601String(),
      'status': instance.status,
      'neighborhood_uuid': instance.neighborhoodUuid,
      'genre_uuid': instance.genreUuid,
      'provenace_uuid': instance.provenaceUuid,
      'reason_opening_case_uuid': instance.reasonOpeningCaseUuid,
      'document_type_uuid': instance.documentTypeUuid,
      'created_at': instance.createdAt.toIso8601String(),
      'update_at': instance.updatedAt.toIso8601String(),
    };
