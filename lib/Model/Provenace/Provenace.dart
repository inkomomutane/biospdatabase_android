import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Provenace.g.dart';

@JsonSerializable()
@HiveType(typeId: 6)
class Provenace extends HiveObject {
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
  Provenace(
      {required this.uuid,
      required this.name,
      required this.createdAt,
      required this.updatedAt});
  factory Provenace.fromJson(Map<String, dynamic> json) =>
      _$ProvenaceFromJson(json);
  Map<String, dynamic> toJson() => _$ProvenaceToJson(this);
}
