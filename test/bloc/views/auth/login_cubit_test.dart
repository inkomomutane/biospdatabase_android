import 'package:biosp/bloc/components/views/auth/login_cubit.dart';
import 'package:biosp/bloc/components/views/auth/login_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LoginCubit loginCubit;
  setUp(() {
    loginCubit = LoginCubit();
  });

  test("it should test initial state of login cubit to be empty.", () {
    expect(loginCubit.state.email, '');
    expect(loginCubit.state.password, '');
    expect(loginCubit.state.validated, false);
    expect(loginCubit.state.authenticated, false);
  });

  blocTest(
    "it should change state to new on typing values on login",
    build: () => loginCubit,
    act: (state) =>
        state.emit(const LoginState(email: "email@ts.com", password: '')),
        expect: () => const LoginState(email: "email@t.com", password: ''),
  );

  tearDown(() {
    loginCubit.close();
  });
}
