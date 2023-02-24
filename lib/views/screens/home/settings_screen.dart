import 'package:biosp/bloc/components/cubit/language_cubit.dart';
import 'package:biosp/domain/entity/language_entity.dart';
import 'package:biosp/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final Map<String, String> _languages = {
    'pt': LocaleKeys.portuguese.tr(),
    'fr': LocaleKeys.french.tr(),
    'en': LocaleKeys.english.tr(),
    'es': LocaleKeys.spanish.tr(),
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageEntity>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              LocaleKeys.appSettings.tr(),
              style: const TextStyle(fontSize: 14),
            ),
          ),
          body: Column(
            children: [
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(Icons.translate_sharp),
                ),
                title: Text(
                  LocaleKeys.language.tr(),
                ),
                subtitle:
                    Text(language(context.read<LanguageCubit>().state.lang)),
                onTap: () => showGeneralDialog(
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(context)
                      .modalBarrierDismissLabel,
                  transitionDuration: const Duration(milliseconds: 400),
                  barrierColor: const Color(0x80000000),
                  context: context,
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return SafeArea(
                      right: true,
                      minimum: const EdgeInsets.all(16),
                      child: AlertDialog(
                        elevation: 8,
                        contentPadding: const EdgeInsets.all(10),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                        ),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: _languages.entries
                              .map(
                                (language) => ListTile(
                                  leading: const CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: Icon(Icons.translate_sharp),
                                  ),
                                  title: Text(language.value),
                                  onTap: () {
                                    context
                                        .read<LanguageCubit>()
                                        .change(language.key);
                                    Navigator.pop(context);
                                  },
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(14),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String language(String languageCode) {
    return _languages[languageCode] ?? LocaleKeys.portuguese.tr();
  }
}
