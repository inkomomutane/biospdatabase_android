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
      uuid: fields[0] as String,
      fullName: fields[1] as String?,
      numberOfVisits: fields[4] as String?,
      birthDate: fields[6] as DateTime?,
      phone: fields[7] as String?,
      serviceDate: fields[8] as DateTime?,
      homeCare: fields[18] as bool?,
      purposeOfVisit: fields[9] as String?,
      specifyPurposeOfVisit: fields[10] as String?,
      dateReceived: fields[20] as DateTime?,
      neighborhoodUuid: fields[2] as String?,
      genreUuid: fields[3] as String?,
      provenaceUuid: fields[5] as String?,
      forwardedServiceUuid: fields[15] as String?,
      otherForwardedService: fields[16] as String?,
      specifyForwardedService: fields[17] as String?,
      reasonOpeningCaseUuid: fields[11] as String?,
      otherReasonOpeningCase: fields[12] as String?,
      documentTypeUuid: fields[13] as String?,
      otherDocumentType: fields[14] as String?,
      visitProposes: fields[19] as String?,
      status: fields[21] as bool?,
      knownOfBiospUuid: fields[24] as String?,
      otherKnownOfBiosp: fields[25] as String?,
      createdAt: fields[22] as DateTime,
      updatedAt: fields[23] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Benificiary obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.neighborhoodUuid)
      ..writeByte(3)
      ..write(obj.genreUuid)
      ..writeByte(4)
      ..write(obj.numberOfVisits)
      ..writeByte(5)
      ..write(obj.provenaceUuid)
      ..writeByte(6)
      ..write(obj.birthDate)
      ..writeByte(7)
      ..write(obj.phone)
      ..writeByte(8)
      ..write(obj.serviceDate)
      ..writeByte(9)
      ..write(obj.purposeOfVisit)
      ..writeByte(10)
      ..write(obj.specifyPurposeOfVisit)
      ..writeByte(11)
      ..write(obj.reasonOpeningCaseUuid)
      ..writeByte(12)
      ..write(obj.otherReasonOpeningCase)
      ..writeByte(13)
      ..write(obj.documentTypeUuid)
      ..writeByte(14)
      ..write(obj.otherDocumentType)
      ..writeByte(15)
      ..write(obj.forwardedServiceUuid)
      ..writeByte(16)
      ..write(obj.otherForwardedService)
      ..writeByte(17)
      ..write(obj.specifyForwardedService)
      ..writeByte(18)
      ..write(obj.homeCare)
      ..writeByte(19)
      ..write(obj.visitProposes)
      ..writeByte(20)
      ..write(obj.dateReceived)
      ..writeByte(21)
      ..write(obj.status)
      ..writeByte(22)
      ..write(obj.createdAt)
      ..writeByte(23)
      ..write(obj.updatedAt)
      ..writeByte(24)
      ..write(obj.knownOfBiospUuid)
      ..writeByte(25)
      ..write(obj.otherKnownOfBiosp);
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

Benificiary _$BenificiaryFromJson(Map<String, dynamic> json) => Benificiary(
      uuid: json['uuid'] as String,
      fullName: json['full_name'] as String?,
      numberOfVisits: json['number_of_visits'] as String?,
      birthDate: json['birth_date'] == null
          ? null
          : DateTime.parse(json['birth_date'] as String),
      phone: json['phone'] as String?,
      serviceDate: json['service_date'] == null
          ? null
          : DateTime.parse(json['service_date'] as String),
      homeCare: json['home_care'] as bool?,
      purposeOfVisit: json['purpose_of_visit_uuid'] as String?,
      specifyPurposeOfVisit: json['specify_purpose_of_visit'] as String?,
      dateReceived: json['date_received'] == null
          ? null
          : DateTime.parse(json['date_received'] as String),
      neighborhoodUuid: json['neighborhood_uuid'] as String?,
      genreUuid: json['genre_uuid'] as String?,
      provenaceUuid: json['provenace_uuid'] as String?,
      forwardedServiceUuid: json['forwarded_service_uuid'] as String?,
      otherForwardedService: json['other_forwarded_service'] as String?,
      specifyForwardedService: json['specify_forwarded_service'] as String?,
      reasonOpeningCaseUuid: json['reason_opening_case_uuid'] as String?,
      otherReasonOpeningCase: json['other_reason_opening_case'] as String?,
      documentTypeUuid: json['document_type_uuid'] as String?,
      otherDocumentType: json['other_document_type'] as String?,
      visitProposes: json['visit_proposes'] as String?,
      status: json['status'] as bool?,
      knownOfBiospUuid: json['known_of_biosp_uuid'] as String?,
      otherKnownOfBiosp: json['other_known_of_biosp'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$BenificiaryToJson(Benificiary instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'full_name': instance.fullName,
      'neighborhood_uuid': instance.neighborhoodUuid,
      'genre_uuid': instance.genreUuid,
      'number_of_visits': instance.numberOfVisits,
      'provenace_uuid': instance.provenaceUuid,
      'birth_date': instance.birthDate?.toIso8601String(),
      'phone': instance.phone,
      'service_date': instance.serviceDate?.toIso8601String(),
      'purpose_of_visit_uuid': instance.purposeOfVisit,
      'specify_purpose_of_visit': instance.specifyPurposeOfVisit,
      'reason_opening_case_uuid': instance.reasonOpeningCaseUuid,
      'other_reason_opening_case': instance.otherReasonOpeningCase,
      'document_type_uuid': instance.documentTypeUuid,
      'other_document_type': instance.otherDocumentType,
      'forwarded_service_uuid': instance.forwardedServiceUuid,
      'other_forwarded_service': instance.otherForwardedService,
      'specify_forwarded_service': instance.specifyForwardedService,
      'home_care': instance.homeCare,
      'visit_proposes': instance.visitProposes,
      'date_received': instance.dateReceived?.toIso8601String(),
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'known_of_biosp_uuid': instance.knownOfBiospUuid,
      'other_known_of_biosp': instance.otherKnownOfBiosp,
    };
