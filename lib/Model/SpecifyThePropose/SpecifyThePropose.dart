import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SpecifyThePropose.g.dart';

@JsonSerializable()
@HiveType(typeId: 10)
class SpecifyThePropose extends HiveObject {
  @HiveField(0)
  late String uuid;

  @HiveField(1)
  @JsonKey(name: 'purpose_of_visit_uuid')
  late String purposeOfVisitUuid;

  @HiveField(2)
  @JsonKey(name: 'benificiary_uuid')
  late String benificiaryUuid;

  @HiveField(4)
  @JsonKey(name: 'specify_the_propose')
  late String specifyThePropose;

  @HiveField(5)
  @JsonKey(name: 'created_at')
  late DateTime createdAt;

  @HiveField(6)
  @JsonKey(name: 'update_at')
  late DateTime updatedAt;

  SpecifyThePropose(
      {required this.purposeOfVisitUuid,
      required this.benificiaryUuid,
      required this.specifyThePropose,
      required this.uuid,
      required this.createdAt,
      required this.updatedAt});
  factory SpecifyThePropose.fromJson(Map<String, dynamic> json) =>
      _$SpecifyTheProposeFromJson(json);
  Map<String, dynamic> toJson() => _$SpecifyTheProposeToJson(this);
}
