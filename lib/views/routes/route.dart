import 'package:biosp/bloc/components/views/auth/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/components/cubit/beneficiary_crud_bottom_bar_index_cubit.dart';
import '../../bloc/components/cubit/create_update_beneficiary_cubit.dart';
import '../../bloc/components/cubit/hidden_password_cubit.dart';
import '../../bloc/components/cubit/home_bottom_bar_index_cubit.dart';
import '../../bloc/components/cubit/language_cubit.dart';
import '../../domain/actions/get_auth_user.dart';
import '../screens/auth/auth_screen.dart';
import '../screens/crud/create_update_screen.dart';
import '../screens/home/home.dart';
import '../screens/home/settings_screen.dart';

class BiospGeneratedRouting {
  final _createUpdateBeneficiaryCubit = CreateUpdateBeneficiaryCubit();
  final _beneficiaryCrudBottomBarIndexCubit =
      BeneficiaryCrudBottomBarIndexCubit();
  final _hiddenPasswordCubit = HiddenPasswordCubit();
  final _loginCubit = LoginCubit();
  final _homeBottomBarIndexCubit = HomeBottomBarIndexCubit();
  final _languageCubit = LanguageCubit();

  Route generatedRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => FutureBuilder(
            future: GetIt.I<GetAuthUser>()(),
            builder: (_, snap) {
              if (snap.hasData) {
                return snap.data!.fold(
                  (l) => MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                        value: _languageCubit,
                      ),
                      BlocProvider.value(
                        value: _hiddenPasswordCubit,
                      ),
                      BlocProvider.value(
                        value: _loginCubit,
                      ),
                    ],
                    child: const AuthScreen(),
                  ),
                  (r) {
                    if (r.token.isNotEmpty) {
                      return MultiBlocProvider(
                        providers: [
                          BlocProvider.value(
                            value: _languageCubit,
                          ),
                          BlocProvider.value(
                            value: _homeBottomBarIndexCubit,
                          ),
                          BlocProvider.value(
                            value: _createUpdateBeneficiaryCubit,
                          ),
                        ],
                        child: const HomeScreen(),
                      );
                    }
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider.value(
                          value: _languageCubit,
                        ),
                        BlocProvider.value(
                          value: _hiddenPasswordCubit,
                        ),
                        BlocProvider.value(
                          value: _loginCubit,
                        ),
                      ],
                      child: const AuthScreen(),
                    );
                  },
                );
              }
              return MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: _languageCubit,
                  ),
                  BlocProvider.value(
                    value: _hiddenPasswordCubit,
                  ),
                  BlocProvider.value(
                    value: _loginCubit,
                  ),
                ],
                child: const AuthScreen(),
              );
            },
          ),
        );
      case 'login':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _languageCubit,
              ),
              BlocProvider.value(
                value: _hiddenPasswordCubit,
              ),
            ],
            child: const AuthScreen(),
          ),
        );
      case 'home':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _languageCubit,
              ),
              BlocProvider.value(
                value: _homeBottomBarIndexCubit,
              ),
              BlocProvider.value(
                value: _createUpdateBeneficiaryCubit,
              ),
            ],
            child: const HomeScreen(),
          ),
        );
      case 'create_update':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _languageCubit,
              ),
              BlocProvider.value(
                value: _beneficiaryCrudBottomBarIndexCubit,
              ),
              BlocProvider.value(
                value: _createUpdateBeneficiaryCubit,
              ),
            ],
            child: const CreateUpdateScreen(),
          ),
        );
      case 'settings':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _languageCubit),
            ],
            child: SettingsScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _languageCubit),
              BlocProvider.value(value: _hiddenPasswordCubit),
            ],
            child: const AuthScreen(),
          ),
        );
    }
  }

  void close() {
    _createUpdateBeneficiaryCubit.close();
    _beneficiaryCrudBottomBarIndexCubit.close();
    _hiddenPasswordCubit.close();
    _loginCubit.close();
    _homeBottomBarIndexCubit.close();
    _languageCubit.close();
  }
}
