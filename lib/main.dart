import 'package:biosp/counter_cubit.dart';
import 'package:biosp/translations/codegen_loader.g.dart';
import 'package:biosp/translations/locale_keys.g.dart';
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
    const FlexScheme usedScheme = FlexScheme.bigStone;
    return MaterialApp(
      title: 'Counter App',
      theme: FlexThemeData.light(
          useMaterial3: true,
          textTheme: GoogleFonts.jostTextTheme(),
          scheme: usedScheme),
      darkTheme: FlexThemeData.dark(
          useMaterial3: true,
          textTheme: GoogleFonts.jostTextTheme(),
          scheme: usedScheme),
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
                    DatePickerDialog(
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100)),
                    TextFormField(),
                    DropdownButtonFormField(items: [], onChanged: (option) {}),
                    DropdownSearch<String>(
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
                    TextComponent(hintText: LocaleKeys.Hi.tr())


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
