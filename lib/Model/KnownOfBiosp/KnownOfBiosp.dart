import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'KnownOfBiosp.g.dart';

@JsonSerializable()
@HiveType(typeId: 10)
class KnownOfBiosp extends HiveObject {
  @HiveField(0)
  late String uuid;

  @HiveField(1)
  late String name;

  @HiveField(2)
  @JsonKey(name: 'created_at')
  late DateTime? createdAt;

  @HiveField(3)
  @JsonKey(name: 'updated_at')
  late DateTime? updatedAt;
  KnownOfBiosp(
      {required this.uuid,
      required this.name,
      required this.createdAt,
      required this.updatedAt});
  factory KnownOfBiosp.fromJson(Map<String, dynamic> json) =>
      _$KnownOfBiospFromJson(json);
  Map<String, dynamic> toJson() => _$KnownOfBiospToJson(this);

  ///this method will prevent the override of toString
  String asDropdownString() {
    return '${this.name}';
  }

  ///this method will prevent the override of toString

  ///custom comparing function to check if two users are equal
  bool isEqual(KnownOfBiosp model) {
    return this.uuid == model.uuid;
  }

  @override
  String toString() => name;
}
