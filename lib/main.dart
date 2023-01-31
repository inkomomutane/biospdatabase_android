import 'package:biosp/counter_cubit.dart';
import 'package:biosp/translations/codegen_loader.g.dart';
import 'package:biosp/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    BlocProvider(
      create: (ctx) => CounterCubit(),
      child: EasyLocalization(
        fallbackLocale: const Locale('pt'),
        assetLoader: const CodegenLoader(),
        supportedLocales: const [
          Locale('en'),
          Locale('pt'),
          Locale('fr'),
        ],
        startLocale: const Locale('pt'),
        saveLocale: true,
        path: '/assets/translations',
        child: const CounterHome(),
      ),
    ),
  );
}

class CounterHome extends StatelessWidget {
  const CounterHome({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.jostTextTheme(),
      ),
      home: Scaffold(
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
          onPressed: () => BlocProvider.of<CounterCubit>(context).increment(),
        ),
        body: BlocListener<CounterCubit, CounterState>(
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
              return Text('counter: ${state.counter}');
            },
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
    );
  }
}
