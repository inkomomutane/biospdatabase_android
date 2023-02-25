import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../domain/actions/get_auth_user.dart';
import '../screens/auth/auth_screen.dart';
import '../screens/crud/create_update_screen.dart';
import '../screens/home/home.dart';
import '../screens/home/settings_screen.dart';

class BiospgeneratedRouting {
  Route generatedRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => FutureBuilder(
              future: GetIt.I<GetAuthUser>()(),
              builder: (_, snap) {
                if (snap.hasData) {
                  return snap.data!.fold((l) => const AuthScreen(), (r) {
                    if (r.token.isNotEmpty) {
                      return const HomeScreen();
                    }
                    return const AuthScreen();
                  });
                }
                return const AuthScreen();
              }),
        );
      case 'login':
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case 'home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case 'create_update':
        return MaterialPageRoute(builder: (_) => const CreateUpdateScreen());
      case 'settings':
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
    }
  }
}
