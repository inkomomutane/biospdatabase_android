import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState extends Equatable with _$LoginState {
  const LoginState._();
  const factory LoginState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool validated,
    @Default(false) bool authenticated,
    @Default('') String ulid,
  }) = _LoginState;

  @override
  List<Object?> get props => [email, password, validated, authenticated, ulid];
}
