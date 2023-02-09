import 'login_state.dart';
import '../../../sync/auth_sync.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState(email: '', password: ''));

  void validate(LoginState loginState) =>
      emit(loginState.copyWith(validated: false));

  void login(bool validated) async {
    if (validated) {
      var auth = await AuthSync(GetIt.I<Isar>())(state);
      auth.fold(
        (l) => emit(state.copyWith(
            authenticated: false,
            validated: true,
            ulid: ULID.nextULID().toString())),
        (r) => emit(
          state.copyWith(
            authenticated: r,
            validated: true,
            ulid: ULID.nextULID().toString(),
          ),
        ),
      );
    } else {
      emit(state.copyWith(
        authenticated: false,
        validated: false,
      ));
    }
  }
}
