import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'PurposeOfVisit.g.dart';

@JsonSerializable()
@HiveType(typeId: 8)
class PurposeOfVisit extends HiveObject {
  @HiveField(0)
  final String uuid;

  @HiveField(1)
  final String name;

  @HiveField(2)
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @HiveField(3)
  @JsonKey(name: 'update_at')
  final DateTime updatedAt;
  PurposeOfVisit(
      {required this.uuid,
      required this.name,
      required this.createdAt,
      required this.updatedAt});
  factory PurposeOfVisit.fromJson(Map<String, dynamic> json) =>
      _$PurposeOfVisitFromJson(json);
  Map<String, dynamic> toJson() => _$PurposeOfVisitToJson(this);
}
