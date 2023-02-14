import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hidden_passowrd_cubit.freezed.dart';
part 'hidden_passowrd_state.dart';

class HiddenPassowrdCubit extends Cubit<HiddenPassowrdState> {
  HiddenPassowrdCubit() : super(const HiddenPassowrdState());
  void change() => emit(state.copyWith(hidden: !state.hidden));
}
