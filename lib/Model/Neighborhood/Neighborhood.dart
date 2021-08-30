import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Neighborhood.g.dart';

@JsonSerializable()
@HiveType(typeId: 5)
class Neighborhood extends HiveObject {
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
  Neighborhood(
      {required this.uuid,
      required this.name,
      required this.createdAt,
      required this.updatedAt});
  factory Neighborhood.fromJson(Map<String, dynamic> json) =>
      _$NeighborhoodFromJson(json);
  Map<String, dynamic> toJson() => _$NeighborhoodToJson(this);
}
