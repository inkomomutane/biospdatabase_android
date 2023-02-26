

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';
part 'hidden_password_state.freezed.dart';
@freezed
class HiddenPasswordState extends Equatable  with _$HiddenPasswordState{
  const HiddenPasswordState._();
  const factory HiddenPasswordState({
    @Default(true) bool hidden,
}) = _HiddenPasswordState;

  @override
  List<Object?> get props => [hidden];
}
