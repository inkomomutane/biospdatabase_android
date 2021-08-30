import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Province.g.dart';

@JsonSerializable()
@HiveType(typeId: 7)
class Province extends HiveObject {
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
  Province(
      {required this.uuid,
      required this.name,
      required this.createdAt,
      required this.updatedAt});
  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);
  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
}
