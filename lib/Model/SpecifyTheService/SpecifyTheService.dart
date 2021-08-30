import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SpecifyTheService.g.dart';

@JsonSerializable()
@HiveType(typeId: 11)
class SpecifyTheService extends HiveObject {
  @HiveField(1)
  late String uuid;

  @HiveField(2)
  @JsonKey(name: 'benificiary_uuid')
  late String benificiaryUuid;

  @HiveField(3)
  @JsonKey(name: 'forwarded_service_uuid')
  late String forwardedServiceUuid;

  @HiveField(4)
  @JsonKey(name: 'specify_the_service')
  late String specifyTheService;

  @HiveField(5)
  @JsonKey(name: 'created_at')
  late DateTime createdAt;

  @HiveField(6)
  @JsonKey(name: 'update_at')
  late DateTime updatedAt;
  SpecifyTheService(
      {required this.benificiaryUuid,
      required this.forwardedServiceUuid,
      required this.specifyTheService,
      required this.uuid,
      required this.createdAt,
      required this.updatedAt});
  factory SpecifyTheService.fromJson(Map<String, dynamic> json) =>
      _$SpecifyTheServiceFromJson(json);
  Map<String, dynamic> toJson() => _$SpecifyTheServiceToJson(this);
}
