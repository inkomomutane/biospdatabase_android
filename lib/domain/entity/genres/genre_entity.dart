import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ulid4d/ulid4d.dart';

part 'genre_entity.freezed.dart';

@freezed
class GenreEntity extends Equatable with _$GenreEntity {
  const factory GenreEntity({
    required ULID ulid,
    required String name
  }) = _GenreEntity;

  const GenreEntity._();
  @override
  List<Object?> get props => [ulid,name];
}
