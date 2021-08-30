import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'DocumentType.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class DocumentType extends HiveObject {
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

  DocumentType(
      {required this.uuid,
      required this.name,
      required this.createdAt,
      required this.updatedAt});
  factory DocumentType.fromJson(Map<String, dynamic> json) =>
      _$DocumentTypeFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentTypeToJson(this);
}
