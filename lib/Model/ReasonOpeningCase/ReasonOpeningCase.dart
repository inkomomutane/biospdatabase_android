import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ReasonOpeningCase.g.dart';

@JsonSerializable()
@HiveType(typeId: 9)
class ReasonOpeningCase extends HiveObject {
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
  ReasonOpeningCase(
      {required this.uuid,
      required this.name,
      required this.createdAt,
      required this.updatedAt});
  factory ReasonOpeningCase.fromJson(Map<String, dynamic> json) =>
      _$ReasonOpeningCaseFromJson(json);
  Map<String, dynamic> toJson() => _$ReasonOpeningCaseToJson(this);

  ///this method will prevent the override of toString
  String asDropdownString() {
    return '${this.name}';
  }

  ///this method will prevent the override of toString

  ///custom comparing function to check if two users are equal
  bool isEqual(ReasonOpeningCase model) {
    return this.uuid == model.uuid;
  }

  @override
  String toString() => name;
}
