import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_entity.freezed.dart';

@freezed
class AuthEntity extends Equatable with _$AuthEntity {
  const factory AuthEntity({
    int? id,
    required String name,
    required String email,
    required String token,
  }) = _AuthEntity;

  const AuthEntity._();
  @override
  List<Object?> get props => [id,name, email, token];
}
