import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../bloc/components/cubit/language_cubit.dart';
import '../../../domain/actions/biosp_services/get_all_biosps.dart';
import '../../../domain/actions/biosp_services/get_all_document_types.dart';
import '../../../domain/actions/biosp_services/get_all_forwarded_services.dart';
import '../../../domain/actions/biosp_services/get_all_genres.dart';
import '../../../domain/actions/biosp_services/get_all_provenance.dart';
import '../../../domain/actions/biosp_services/get_all_purpuse_of_visits.dart';
import '../../../domain/actions/biosp_services/get_all_reasons_of_opening_case.dart';
import '../../../domain/entity/biosps/biosp_entity.dart';
import '../../../domain/entity/language_entity.dart';
import '../../../translations/locale_keys.g.dart';
import '../../components/date_component.dart';
import '../../components/datetime_component.dart';
import '../../components/label_component.dart';
import '../../components/number_component.dart';
import '../../components/phone_number_component.dart';
import '../../components/select_component.dart';
import '../../components/text_component.dart';

class CreateUpdateScreen extends StatelessWidget {
  const CreateUpdateScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocBuilder<LanguageCubit, LanguageEntity>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.createResource.tr(namedArgs: {
              'resource': LocaleKeys.beneficiary.tr().toLowerCase()
            })),
          ),
          body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelComponent(labelText: LocaleKeys.projectName.tr()),
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
                        },
                      ),
                      LabelComponent(
                        labelText: LocaleKeys.genres.tr().capitalize,
                      ),
                      FutureBuilder(
                        future: GetIt.I<GetAllBiosps>()(),
                        builder: (_, snap) {
                          if (snap.hasData) {
                            snap.data?.fold(
                                (l) => SelectComponent(
                                      hintText: LocaleKeys.neighborhoods.tr(),
                                      items: const <GetAllGenres>[],
                                      selectedItem: null,
                                    ), (r) {
                              return SelectComponent(
                                hintText: LocaleKeys.genres.tr().capitalize,
                                items: r,
                                selectedItem: r.isNotEmpty ? r.first : null,
                              );
                            });
                          }
                          return SelectComponent(
                            hintText: LocaleKeys.genres.tr().capitalize,
                            items: const <GetAllGenres>[],
                            selectedItem: null,
                          );
                        },
                      ),
                      const LabelComponent(
                        labelText: "Frequência",
                      ),
                      NumberComponent(
                        hintText: "Frequência",
                      ),
                      LabelComponent(
                        labelText: LocaleKeys.provenance.tr().capitalize,
                      ),
                      FutureBuilder(
                        future: GetIt.I<GetAllProvenances>()(),
                        builder: (_, snap) {
                          if (snap.hasData) {
                            snap.data?.fold(
                                (l) => SelectComponent(
                                      hintText: LocaleKeys.provenances.tr(),
                                      items: const <GetAllProvenances>[],
                                      selectedItem: null,
                                    ), (r) {
                              return SelectComponent(
                                hintText:
                                    LocaleKeys.provenances.tr().capitalize,
                                items: r,
                                selectedItem: r.isNotEmpty ? r.first : null,
                              );
                            });
                          }
                          return SelectComponent(
                            hintText: LocaleKeys.provenances.tr().capitalize,
                            items: const <GetAllProvenances>[],
                            selectedItem: null,
                          );
                        },
                      ),
                      const LabelComponent(
                        labelText: "Data de nascimento",
                      ),
                      DateComponent(),
                      const LabelComponent(
                        labelText: "Contacto",
                      ),
                      PhoneNumberComponent(
                        hintText: "Contacto",
                      ),
                      const LabelComponent(
                        labelText: "Data de atendimento",
                      ),
                      DateTimeComponent(),
                      LabelComponent(
                        labelText: LocaleKeys.purposeOfVisit.tr().capitalize,
                      ),
                      FutureBuilder(
                        future: GetIt.I<GetAllPurposeOfVisits>()(),
                        builder: (_, snap) {
                          if (snap.hasData) {
                            snap.data?.fold(
                                (l) => SelectComponent(
                                      hintText: LocaleKeys.purposesOfVisit.tr(),
                                      items: const <GetAllPurposeOfVisits>[],
                                      selectedItem: null,
                                    ), (r) {
                              return SelectComponent(
                                hintText:
                                    LocaleKeys.purposesOfVisit.tr().capitalize,
                                items: r,
                                selectedItem: r.isNotEmpty ? r.first : null,
                              );
                            });
                          }
                          return SelectComponent(
                            hintText:
                                LocaleKeys.purposesOfVisit.tr().capitalize,
                            items: const <GetAllPurposeOfVisits>[],
                            selectedItem: null,
                          );
                        },
                      ),
                      const TextComponent(
                        hintText: "Se tiver formação profissional Especificar",
                      ),
                      const TextComponent(
                        hintText: "Se tiver formação profissional Especificar",
                      ),
                      LabelComponent(
                        labelText:
                            LocaleKeys.reasonOfOpeningCase.tr().capitalize,
                      ),
                      FutureBuilder(
                        future: GetIt.I<GetAllReasonOfOpeningCases>()(),
                        builder: (_, snap) {
                          if (snap.hasData) {
                            snap.data?.fold(
                                (l) => SelectComponent(
                                      hintText:
                                          LocaleKeys.reasonOfOpeningCase.tr(),
                                      items: const <
                                          GetAllReasonOfOpeningCases>[],
                                      selectedItem: null,
                                    ), (r) {
                              return SelectComponent(
                                hintText: LocaleKeys.reasonOfOpeningCase
                                    .tr()
                                    .capitalize,
                                items: r,
                                selectedItem: r.isNotEmpty ? r.first : null,
                              );
                            });
                          }
                          return SelectComponent(
                            hintText:
                                LocaleKeys.reasonOfOpeningCase.tr().capitalize,
                            items: const <GetAllReasonOfOpeningCases>[],
                            selectedItem: null,
                          );
                        },
                      ),
                      const LabelComponent(labelText: "Outro Motivo"),
                      const TextComponent(hintText: "Outro Motivo"),
                      LabelComponent(
                        labelText: LocaleKeys.documentNeeded.tr().capitalize,
                      ),
                      FutureBuilder(
                        future: GetIt.I<GetAllDocumentTypes>()(),
                        builder: (_, snap) {
                          if (snap.hasData) {
                            snap.data?.fold(
                                (l) => SelectComponent(
                                      hintText: LocaleKeys.documentNeeded.tr(),
                                      items: const <GetAllDocumentTypes>[],
                                      selectedItem: null,
                                    ), (r) {
                              return SelectComponent(
                                hintText:
                                    LocaleKeys.documentNeeded.tr().capitalize,
                                items: r,
                                selectedItem: r.isNotEmpty ? r.first : null,
                              );
                            });
                          }
                          return SelectComponent(
                            hintText: LocaleKeys.documentNeeded.tr().capitalize,
                            items: const <GetAllDocumentTypes>[],
                            selectedItem: null,
                          );
                        },
                      ),
                      const LabelComponent(labelText: "Outro documento"),
                      const TextComponent(
                        hintText: "Outro documento",
                      ),
                      LabelComponent(
                        labelText: LocaleKeys.forwardedService.tr().capitalize,
                      ),
                      FutureBuilder(
                        future: GetIt.I<GetAllForwardedServices>()(),
                        builder: (_, snap) {
                          if (snap.hasData) {
                            snap.data?.fold(
                                (l) => SelectComponent(
                                      hintText:
                                          LocaleKeys.forwardedServices.tr(),
                                      items: const <GetAllForwardedServices>[],
                                      selectedItem: null,
                                    ), (r) {
                              return SelectComponent(
                                hintText: LocaleKeys.forwardedServices
                                    .tr()
                                    .capitalize,
                                items: r,
                                selectedItem: r.isNotEmpty ? r.first : null,
                              );
                            });
                          }
                          return SelectComponent(
                            hintText:
                                LocaleKeys.forwardedServices.tr().capitalize,
                            items: const <GetAllForwardedServices>[],
                            selectedItem: null,
                          );
                        },
                      ),
                      const LabelComponent(labelText: "Outro serviço"),
                      const TextComponent(
                        hintText: "Outro serviço",
                      ),
                      const LabelComponent(labelText: "Especificar Serviço"),
                      const TextComponent(
                        hintText: "Especificar Serviço",
                      ),
                      const LabelComponent(
                        labelText: "Necessita de acompanhamento domiciliar?",
                      ),
                      const SelectComponent(
                        hintText: "Necessita de acompanhamento domiciliar?",
                        items: <Map<bool, String>>[
                          {true: "Sim"},
                          {false: "Não"}
                        ],
                        selectedItem: {true, "Sim"},
                      ),
                      LabelComponent(
                        labelText: LocaleKeys.purposeOfVisit.tr().capitalize,
                      ),
                      TextComponent(
                        hintText: LocaleKeys.purposeOfVisit.tr().capitalize,
                      ),
                      const LabelComponent(
                          labelText: "Data que foi recebida pelo serviço"),
                      DateTimeComponent(),
                      const LabelComponent(
                          labelText: "Resolveu o seu problema?"),
                      const SelectComponent(
                        hintText: "Resolveu o seu problema?",
                        items: <Map<bool, String>>[
                          {true: "Sim"},
                          {false: "Não"}
                        ],
                        selectedItem: {true, "Sim"},
                      ),
                      const LabelComponent(labelText: ""),
                    ]),
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
                title: Text(
                  LocaleKeys.storeResource.tr(namedArgs: {'resource': ''}),
                ),
                activeColor: Colors.green,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
