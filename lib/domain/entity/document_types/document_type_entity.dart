import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ulid4d/ulid4d.dart';

part 'document_type_entity.freezed.dart';

@freezed
class DocumentTypeEntity extends Equatable with _$DocumentTypeEntity {
  const DocumentTypeEntity._();
  const factory DocumentTypeEntity({
    int? id,
    required ULID ulid,
    required String name
  }) = _DocumentTypeEntity;

  @override
  List<Object?> get props => [id,ulid,name];
}
