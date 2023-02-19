import 'package:biosp/domain/actions/biosp_services/get_all_biosps.dart';
import 'package:biosp/views/components/label_component.dart';
import 'package:biosp/views/components/select_component.dart';
import 'package:biosp/views/components/text_component.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/entity/biosps/biosp_entity.dart';
import '../../../translations/locale_keys.g.dart';

class CreateUpdateScreen extends StatelessWidget {
  const CreateUpdateScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LabelComponent(labelText: "Nome completo"),
                const TextComponent(hintText: "Nome completo"),
                LabelComponent(labelText: LocaleKeys.neighborhoods.tr()),
                FutureBuilder(
                    future: GetIt.I<GetAllBiosps>()(),
                    builder: (_, snap) {
                      if (snap.hasData) {
                        snap.data?.fold(
                            (l) => SelectComponent(
                                  hintText: LocaleKeys.neighborhoods.tr(),
                                  items: const <BiospEntity>[],
                                  selectedItem: null,
                                ), (r) {
                          return SelectComponent(
                            hintText: LocaleKeys.neighborhoods.tr(),
                            items: r,
                            selectedItem: r.isNotEmpty ? r.first : null,
                          );
                        });
                      }
                      return SelectComponent(
                        hintText: LocaleKeys.neighborhoods.tr(),
                        items: const <BiospEntity>[],
                        selectedItem: null,
                      );
                    }),
              ],
            ),
          )),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: 1,
        showElevation: true,
        itemCornerRadius: 14,
        curve: Curves.easeIn,
        onItemSelected: (index) {
          if (index == 0) {
            Navigator.of(context).pop();
          }
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.block),
            title: const Text('Cancelar'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.save),
            title: const Text('Guardar'),
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
