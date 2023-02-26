import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part  'true_false_entity.freezed.dart';
@freezed
class TrueFalseEntity extends Equatable with _$TrueFalseEntity{
  const TrueFalseEntity._();
  const factory TrueFalseEntity({
    required bool key,
    required String value,
  }) = _TrueFalseEntity;

  @override
  List<Object?> get props => [key,value];
}