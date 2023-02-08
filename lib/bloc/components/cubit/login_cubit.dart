import 'package:biosp/bloc/components/cubit/login_state.dart';
import 'package:biosp/sync/auth_sync.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void login(LoginState loginState) async {
    if (loginState.validated) {
      var auth = await AuthSync(GetIt.I<Isar>())(loginState);
      auth.fold((l) => null,
          (r) => loginState = loginState.copyWith(authenticated: r));
    }
    // debugPrint(loginState.props.toString());
    emit(loginState);
  }
}
