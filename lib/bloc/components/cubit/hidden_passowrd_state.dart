part of 'hidden_passowrd_cubit.dart';

@freezed
class HiddenPassowrdState extends Equatable with _$HiddenPassowrdState {
  const HiddenPassowrdState._();
  const factory HiddenPassowrdState({
    @Default(true) bool hidden,
  }) = _HiddenPassowrdState;

  @override
  List<Object?> get props => [hidden];
}
