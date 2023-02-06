import 'package:biosp/counter_cubit.dart';
import 'package:biosp/translations/codegen_loader.g.dart';
import 'package:biosp/translations/locale_keys.g.dart';
import 'package:biosp/views/components/label_component.dart';
import 'package:biosp/views/components/number_component.dart';
import 'package:biosp/views/components/password_component.dart';
import 'package:biosp/views/components/phone_number_component.dart';
import 'package:biosp/views/components/select_component.dart';
import 'package:biosp/views/components/date_component.dart';
import 'package:biosp/views/components/datetime_component.dart';
import 'package:biosp/views/components/text_component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:collection/collection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    fallbackLocale: const Locale('pt'),
    useOnlyLangCode: false,
    supportedLocales: const [
      Locale('en'),
      Locale('pt'),
      Locale('fr'),
    ],
    path: 'assets/translations',
    assetLoader: const CodegenLoader(),
    startLocale: const Locale('pt'),
    saveLocale: true,
    child: BlocProvider(
      create: (ctx) => CounterCubit(),
      child: const CounterHome(),
    ),
  ));
}

class CounterHome extends StatelessWidget {
  const CounterHome({super.key});
  final ThemeMode mode = ThemeMode.light;
  @override
  Widget build(BuildContext context) {
    const FlexScheme usedScheme = FlexScheme.amber;
    return MaterialApp(
      title: 'Counter App',
      // theme: FlexThemeData.light(
      //     useMaterial3: true,
      //     textTheme: GoogleFonts.jostTextTheme(),
      //     scheme: usedScheme),
      // darkTheme: FlexThemeData.dark(
      //     useMaterial3: true,
      //     textTheme: GoogleFonts.jostTextTheme(),
      //     scheme: usedScheme),


      // Made for FlexColorScheme version 7.0.0-dev.2 (beta). Make sure
// you use same or higher version, but still same major version. If
// you use a lower version, some properties may not be supported. In
// that case you can also remove them after copying the theme to your app.
      theme: FlexThemeData.light(
        scheme: usedScheme,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 9,
        // tabBarStyle: null,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,

        // To use the playground font, add GoogleFonts package and uncomment
        fontFamily: GoogleFonts.jost().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: usedScheme,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
        // tabBarStyle: null,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        fontFamily: GoogleFonts.jost().fontFamily,
      ),
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,




      themeMode: mode,
      home: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.incremented) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Success: ${state.counter}'),
                duration: const Duration(milliseconds: 100),
              ),
            );
          }
        },
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(
                    LocaleKeys.Hi.tr(),
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  tooltip: 'Increment',
                  child: const Icon(
                    Icons.plus_one,
                  ),
                  onPressed: () async {
                    var list = [
                      const Locale('pt'),
                      const Locale('en'),
                      const Locale('fr')
                    ];
                    shuffle(list);

                    await context.setLocale(list.first);
                  },
                  // BlocProvider.of<CounterCubit>(context).increment(),
                ),
                body: ListView(
                  children: [
                    Text("Rebuild: ${LocaleKeys.Hi.tr()}"),

                    Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35, top: 10),
                      child: DropdownSearch<String>(
                      popupProps: PopupProps.menu(
                        showSelectedItems: true,
                        showSearchBox: true,
                        disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: const [
                        "Brazil",
                        "Italia (Disabled)",
                        "Tunisia",
                        'Canada'
                      ],
                      dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Menu mode",
                          hintText: "country in menu mode",
                        ),
                      ),
                      onChanged: print,
                      selectedItem: "Brazil",
                    ),
                    ),
                    TextComponent(hintText: LocaleKeys.Hi.tr()),
                    DateTimeComponent(),
                    DateComponent(),
                    PasswordComponent(hintText: 'Password',),
                    const LabelComponent(labelText: 'Name'),
                    SelectComponent(hintText: 'T', items: const <String>[
                      "Brazil",
                      "Italia (Disabled)",
                      "Tunisia",
                      'Canada',
                      'Massamba',
                      'manguinha',
                      'Serão',
                      'Fuja',
                      'Sopo',
                      'Menga'
                    ]),
                    const LabelComponent(labelText: 'Name'),
                    NumberComponent(),
                    const LabelComponent(labelText: ''),
                    PhoneNumberComponent(),
                    const LabelComponent(labelText: ''),



                  ],
                ));
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
    );
  }
}
