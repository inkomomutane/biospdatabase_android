import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Genre.g.dart';

@JsonSerializable()
@HiveType(typeId: 4)
class Genre extends HiveObject {
  @HiveField(0)
  late String? uuid;

  @HiveField(1)
  late String name;

  @HiveField(2)
  @JsonKey(name: 'created_at')
  late DateTime createdAt;

  @HiveField(3)
  @JsonKey(name: 'update_at')
  late DateTime updatedAt;
  Genre(
      {this.uuid,
      required this.name,
      required this.createdAt,
      required this.updatedAt});
  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}
