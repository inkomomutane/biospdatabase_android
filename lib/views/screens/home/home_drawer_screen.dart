import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../bloc/components/cubit/language_cubit.dart';
import '../../../domain/actions/get_auth_user.dart';
import '../../../domain/entity/language_entity.dart';
import '../../../translations/locale_keys.g.dart';

class HomeDrawerScreen extends StatelessWidget {
  const HomeDrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageEntity>(
      builder: (context, state) {
        return Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text("Biosp Database"),
                accountEmail: FutureBuilder(
                    future: GetIt.I<GetAuthUser>()(),
                    builder: (_, snap) {
                      if (snap.hasData) {
                        return snap.data!.fold(
                          (l) => const Text(""),
                          (r) => Text(r.email.capitalize),
                        );
                      }
                      return const Text("");
                    }),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/drawer.jpg'),
                  ),
                ),
                currentAccountPicture: const Padding(
                  padding: EdgeInsets.all(4),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/icon/icon.png'),
                  ),
                ),
              ),
              const AboutListTile(
                icon: Icon(
                  Icons.info_outline_rounded,
                ),
                applicationVersion: "v2.0.1",
                aboutBoxChildren: [],
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: Text(LocaleKeys.appSettings.tr()),
                onTap: () => Navigator.of(context).pushNamed('settings'),
              )
            ],
          ),
        );
      },
    );
  }
}
