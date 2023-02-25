import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/components/cubit/language_cubit.dart';
import '../../../domain/entity/language_entity.dart';
import 'desktop/desktop_screen.dart';
import 'mobile/mobile_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageEntity>(
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <= 720) {
              return const MobileScreen();
            } else {
              return const DesktopScreen();
            }
          },
        );
      },
    );
  }
}
