import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'PurposeOfVisit.g.dart';

@JsonSerializable()
@HiveType(typeId: 8)
class PurposeOfVisit extends HiveObject {
  @HiveField(0)
  late String uuid;

  @HiveField(1)
  late String name;

  @HiveField(2)
  @JsonKey(name: 'created_at')
  late DateTime createdAt;

  @HiveField(3)
  @JsonKey(name: 'update_at')
  late DateTime updatedAt;
  PurposeOfVisit(
      {required this.uuid,
      required this.name,
      required this.createdAt,
      required this.updatedAt});
  factory PurposeOfVisit.fromJson(Map<String, dynamic> json) =>
      _$PurposeOfVisitFromJson(json);
  Map<String, dynamic> toJson() => _$PurposeOfVisitToJson(this);
}
