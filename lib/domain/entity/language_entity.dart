import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_entity.freezed.dart'; 
@freezed
class LanguageEntity extends Equatable with _$LanguageEntity {
  const LanguageEntity._();
  const factory LanguageEntity({
    @Default('pt') String lang
  }) = $LanguageEntity;

  @override
  List<Object?> get props => [lang];
}