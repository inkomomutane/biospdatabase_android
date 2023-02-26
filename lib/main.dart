import 'package:ulid4d/ulid4d.dart';

import 'bloc/components/cubit/beneficiary_crud_bottom_bar_index_cubit.dart';
import 'bloc/components/cubit/create_update_beneficiary_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/components/cubit/home_bottom_bar_index_cubit.dart';
import 'bloc/components/cubit/hidden_password_cubit.dart';
import 'bloc/components/cubit/language_cubit.dart';
import 'bloc/components/views/auth/login_cubit.dart';
import 'core/inject.dart';
import 'domain/entity/language_entity.dart';
import 'translations/codegen_loader.g.dart';
import 'translations/locale_keys.g.dart';
import 'views/routes/route.dart';

Future<void> main() async {
  Inject.init();
  // GetIt.I<Isar>().writeTxnSync(() {
  //   GetIt.I<Isar>().auths.clearSync();
  // });

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      fallbackLocale: const Locale('pt'),
      useOnlyLangCode: false,
      supportedLocales: const [
        Locale('en'),
        Locale('pt'),
        Locale('fr'),
        Locale('es'),
      ],
      path: 'assets/translations',
      assetLoader: const CodegenLoader(),
      startLocale: const Locale('pt'),
      saveLocale: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (languageContext) => LanguageCubit()),
          BlocProvider(
            create: (loginContext) => LoginCubit(),
          ),
          BlocProvider(
            create: (BuildContext context) => HomeBottomBarIndexCubit(),
          ),
          BlocProvider(
            create: (BuildContext context) =>
                BeneficiaryCrudBottomBarIndexCubit(),
          ),
          BlocProvider(
            create: (hiddenPasswordContext) => HiddenPasswordCubit(),
          ),
          BlocProvider(
            create: (createUpdateBeneficiaryContext) =>
                CreateUpdateBeneficiaryCubit(),
          )
        ],
        child: BlocListener<LanguageCubit, LanguageEntity>(
          listener: (languageContext, state) {
            languageContext.setLocale(Locale(state.lang));
          },
          child: MainEntry(),
        ),
      ),
    ),
  );
}

class MainEntry extends StatelessWidget {
  MainEntry({super.key});
  final ThemeMode mode = ThemeMode.light;
  final BiospgeneratedRouting biospgeneratedRouting = BiospgeneratedRouting();
  @override
  Widget build(BuildContext context) {
    const FlexScheme usedScheme = FlexScheme.deepBlue;
    return MaterialApp(
      title: LocaleKeys.biosp.tr().toUpperCase(),
      theme: FlexThemeData.light(
        scheme: usedScheme,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 9,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: GoogleFonts.jost().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: usedScheme,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: GoogleFonts.jost().fontFamily,
      ),
      themeMode: mode,
      onGenerateRoute: biospgeneratedRouting.generatedRoutes,
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
    );
  }
}
