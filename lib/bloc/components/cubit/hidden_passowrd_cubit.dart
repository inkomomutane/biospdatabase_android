import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hidden_passowrd_state.dart';
part 'hidden_passowrd_cubit.freezed.dart';

class HiddenPassowrdCubit extends Cubit<HiddenPassowrdState> {
  HiddenPassowrdCubit() : super(const HiddenPassowrdState());
  void change() => emit(state.copyWith(hidden: !state.hidden));
}