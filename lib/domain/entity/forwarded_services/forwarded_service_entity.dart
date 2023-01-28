import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ulid4d/ulid4d.dart';

part 'forwarded_service_entity.freezed.dart';
@freezed
class ForwardedServiceEntity extends Equatable with _$ForwardedServiceEntity {

  const factory ForwardedServiceEntity({
    required ULID ulid,
    required String name
  }) = _ForwardedServiceEntity;

  const ForwardedServiceEntity._();
  @override
  List<Object?> get props => [ulid,name];
}