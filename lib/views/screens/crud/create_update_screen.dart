import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../bloc/components/cubit/beneficiary_crud_bottom_bar_index_cubit.dart';
import '../../../bloc/components/cubit/create_update_beneficiary_cubit.dart';
import '../../../bloc/components/cubit/language_cubit.dart';
import '../../../core/validations.dart';
import '../../../domain/actions/biosp_services/get_all_biosps.dart';
import '../../../domain/actions/biosp_services/get_all_document_types.dart';
import '../../../domain/actions/biosp_services/get_all_forwarded_services.dart';
import '../../../domain/actions/biosp_services/get_all_genres.dart';
import '../../../domain/actions/biosp_services/get_all_provenance.dart';
import '../../../domain/actions/biosp_services/get_all_purpuse_of_visits.dart';
import '../../../domain/actions/biosp_services/get_all_reasons_of_opening_case.dart';
import '../../../domain/entity/beneficiaries/beneficiary_entity.dart';
import '../../../domain/entity/biosps/biosp_entity.dart';
import '../../../domain/entity/document_types/document_type_entity.dart';
import '../../../domain/entity/forwarded_services/forwarded_service_entity.dart';
import '../../../domain/entity/genres/genre_entity.dart';
import '../../../domain/entity/language_entity.dart';
import '../../../domain/entity/provenances/provenance_entity.dart';
import '../../../domain/entity/purposes_of_visit/purpose_of_visit_entity.dart';
import '../../../domain/entity/reasons_of_opening_case/reason_of_opening_case_entity.dart';
import '../../../domain/entity/true_false_entity.dart';
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
    const trueFalse = [
      TrueFalseEntity(key: true, value: "Sim"),
      TrueFalseEntity(key: true, value: "Não")
    ];

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
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return TextComponent(
                          hintText: "Nome completo",
                          initialValue: state.fullName,
                          validator: (fullName) => Validation.textValidation(
                              'Nome completo', fullName ?? ''),
                          onChanged: (fullName) => context
                              .read<CreateUpdateBeneficiaryCubit>()
                              .validate(
                                state.copyWith(fullName: fullName),
                              ),
                        );
                      },
                    ),
                    LabelComponent(labelText: LocaleKeys.neighborhoods.tr()),
                    FutureBuilder(
                      future: GetIt.I<GetAllBiosps>()(),
                      builder: (_, snap) {
                        List<BiospEntity>? items;
                        if (snap.hasData) {
                          items = snap.data?.fold((l) => null, (r) => r);
                        }
                        return BlocBuilder<CreateUpdateBeneficiaryCubit,
                            BeneficiaryEntity>(
                          builder: (context, state) {
                            return SelectComponent<BiospEntity>(
                              hintText: LocaleKeys.neighborhoods.tr(),
                              items: items ?? <BiospEntity>[],
                              validator: (item) => Validation.selectValidation(
                                  LocaleKeys.neighborhoods.tr(), item),
                              itemAsString: (p0) => p0!.name,
                              selectedItem: state.biospEntity,
                              onChanged: (biosp) => context
                                  .read<CreateUpdateBeneficiaryCubit>()
                                  .validate(
                                    state.copyWith(biospEntity: biosp),
                                  ),
                            );
                          },
                        );
                      },
                    ),
                    LabelComponent(
                      labelText: LocaleKeys.genres.tr().capitalize,
                    ),
                    FutureBuilder(
                      future: GetIt.I<GetAllGenres>()(),
                      builder: (_, snap) {
                        List<GenreEntity>? items;
                        if (snap.hasData) {
                          items = snap.data?.fold((l) => null, (r) => r);
                        }
                        return BlocBuilder<CreateUpdateBeneficiaryCubit,
                            BeneficiaryEntity>(
                          builder: (context, state) {
                            return SelectComponent<GenreEntity>(
                              hintText: LocaleKeys.genres.tr().capitalize,
                              items: items ?? <GenreEntity>[],
                              validator: (item) => Validation.selectValidation(
                                  LocaleKeys.genres.tr(), item),
                              itemAsString: (p0) => p0!.name,
                              selectedItem: state.genreEntity,
                              onChanged: (genre) => context
                                  .read<CreateUpdateBeneficiaryCubit>()
                                  .validate(
                                    state.copyWith(genreEntity: genre),
                                  ),
                            );
                          },
                        );
                      },
                    ),
                    const LabelComponent(
                      labelText: "Frequência",
                    ),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return NumberComponent(
                          hintText: "Frequência",
                          initialValue: state.numberOfVisits.toString(),
                          validator: (item) => Validation.numberValidation(
                              "Frequência", item ?? ""),
                          onChanged: (frequencia) => context
                              .read<CreateUpdateBeneficiaryCubit>()
                              .validate(
                                state.copyWith(
                                    numberOfVisits: int.parse(frequencia)),
                              ),
                        );
                      },
                    ),
                    LabelComponent(
                      labelText: LocaleKeys.provenance.tr().capitalize,
                    ),
                    FutureBuilder(
                      future: GetIt.I<GetAllProvenances>()(),
                      builder: (_, snap) {
                        List<ProvenanceEntity>? items;
                        if (snap.hasData) {
                          items = snap.data?.fold((l) => null, (r) => r);
                        }
                        return BlocBuilder<CreateUpdateBeneficiaryCubit,
                            BeneficiaryEntity>(
                          builder: (context, state) {
                            return SelectComponent<ProvenanceEntity>(
                              hintText: LocaleKeys.provenances.tr().capitalize,
                              items: items ?? <ProvenanceEntity>[],
                              validator: (item) => Validation.selectValidation(
                                  LocaleKeys.provenances.tr(), item),
                              itemAsString: (p0) => p0!.name,selectedItem: state.provenanceEntity,
                              onChanged: (provenance) => context
                                  .read<CreateUpdateBeneficiaryCubit>()
                                  .validate(
                                    state.copyWith(
                                        provenanceEntity: provenance),
                                  ),
                            );
                          },
                        );
                      },
                    ),
                    const LabelComponent(
                      labelText: "Data de nascimento",
                    ),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return DateComponent(
                          onChanged: (birthDate) => context
                              .read<CreateUpdateBeneficiaryCubit>()
                              .validate(
                                state.copyWith(
                                  birthDate: birthDate ?? DateTime.now(),
                                ),
                              ),
                          initialValue: state.birthDate,
                        );
                      },
                    ),
                    const LabelComponent(
                      labelText: "Contacto",
                    ),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return PhoneNumberComponent(
                          hintText: "Contacto",
                          validator: (contacto) => Validation.phoneValidation(
                              'Contacto', contacto ?? ''),
                          initialValue: state.phone,
                          onChanged: (contacto) => context
                              .read<CreateUpdateBeneficiaryCubit>()
                              .validate(
                                state.copyWith(
                                  phone: contacto,
                                ),
                              ),
                        );
                      },
                    ),
                    const LabelComponent(
                      labelText: "Data de atendimento",
                    ),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return DateTimeComponent(
                          onChanged: (serviceDate) => context
                              .read<CreateUpdateBeneficiaryCubit>()
                              .validate(state.copyWith(
                                  serviceDate: serviceDate ?? DateTime.now())),
                          initialValue: state.serviceDate,
                        );
                      },
                    ),
                    LabelComponent(
                      labelText: LocaleKeys.purposeOfVisit.tr().capitalize,
                    ),
                    FutureBuilder(
                      future: GetIt.I<GetAllPurposeOfVisits>()(),
                      builder: (_, snap) {
                        List<PurposeOfVisitEntity>? items;
                        if (snap.hasData) {
                          items = snap.data?.fold((l) => null, (r) => r);
                        }
                        return BlocBuilder<CreateUpdateBeneficiaryCubit,
                            BeneficiaryEntity>(
                          builder: (context, state) {
                            return SelectComponent<PurposeOfVisitEntity>(
                              hintText:
                                  LocaleKeys.purposesOfVisit.tr().capitalize,
                              items: items ?? <PurposeOfVisitEntity>[],
                              selectedItem: state.purposeOfVisitEntity,
                              validator: (item) => Validation.selectValidation(
                                  LocaleKeys.purposesOfVisit.tr(), item),
                              itemAsString: (p0) => p0!.name,
                              onChanged: (purposesOfVisit) => context
                                  .read<CreateUpdateBeneficiaryCubit>()
                                  .validate(
                                    state.copyWith(
                                      purposeOfVisitEntity: purposesOfVisit,
                                    ),
                                  ),
                            );
                          },
                        );
                      },
                    ),
                    const LabelComponent(
                      labelText: "Se tiver formação profissional Especificar",
                    ),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return TextComponent(
                          hintText:
                              "Se tiver formação profissional Especificar",
                          initialValue: state.specifyPurposeOfVisit,
                          onChanged: (formacao) => context
                              .read<CreateUpdateBeneficiaryCubit>()
                              .validate(state.copyWith(
                                  specifyPurposeOfVisit: formacao)),
                        );
                      },
                    ),
                    LabelComponent(
                      labelText: LocaleKeys.reasonOfOpeningCase.tr().capitalize,
                    ),
                    FutureBuilder(
                      future: GetIt.I<GetAllReasonOfOpeningCases>()(),
                      builder: (_, snap) {
                        List<ReasonOfOpeningCaseEntity>? items;
                        if (snap.hasData) {
                          items = snap.data?.fold((l) => null, (r) => r);
                        }
                        return BlocBuilder<CreateUpdateBeneficiaryCubit,
                            BeneficiaryEntity>(
                          builder: (context, state) {
                            return SelectComponent<ReasonOfOpeningCaseEntity>(
                              hintText: LocaleKeys.reasonOfOpeningCase
                                  .tr()
                                  .capitalize,
                              items: items ?? <ReasonOfOpeningCaseEntity>[],
                              selectedItem: state.reasonOfOpeningCaseEntity,
                              validator: (item) => Validation.selectValidation(
                                  LocaleKeys.reasonsOfOpeningCase.tr(), item),
                              itemAsString: (p0) => p0!.name,
                              onChanged: (reasonsOfOpeningCase) => context
                                  .read<CreateUpdateBeneficiaryCubit>()
                                  .validate(
                                    state.copyWith(
                                      reasonOfOpeningCaseEntity:
                                          reasonsOfOpeningCase,
                                    ),
                                  ),
                            );
                          },
                        );
                      },
                    ),
                    const LabelComponent(labelText: "Outro motivo"),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return TextComponent(
                          hintText: "Outro motivo",
                          initialValue: state.otherReasonOfOpeningCase,
                          onChanged: (motivo) => context
                              .read<CreateUpdateBeneficiaryCubit>()
                              .validate(
                                state.copyWith(
                                    otherReasonOfOpeningCase: motivo),
                              ),
                        );
                      },
                    ),
                    LabelComponent(
                      labelText: LocaleKeys.documentNeeded.tr().capitalize,
                    ),
                    FutureBuilder(
                      future: GetIt.I<GetAllDocumentTypes>()(),
                      builder: (_, snap) {
                        List<DocumentTypeEntity>? items;
                        if (snap.hasData) {
                          items = snap.data?.fold((l) => null, (r) => r);
                        }
                        return BlocBuilder<CreateUpdateBeneficiaryCubit,
                            BeneficiaryEntity>(
                          builder: (context, state) {
                            return SelectComponent<DocumentTypeEntity>(
                              hintText:
                                  LocaleKeys.documentNeeded.tr().capitalize,
                              items: items ?? <DocumentTypeEntity>[],
                              selectedItem: state.documentTypeEntity,
                              itemAsString: (p0) => p0!.name,
                              validator: (item) => Validation.selectValidation(
                                  LocaleKeys.documentNeeded.tr(), item),
                              onChanged: (documentNeeded) => context
                                  .read<CreateUpdateBeneficiaryCubit>()
                                  .validate(
                                    state.copyWith(
                                      documentTypeEntity: documentNeeded,
                                    ),
                                  ),
                            );
                          },
                        );
                      },
                    ),
                    const LabelComponent(labelText: "Outro documento"),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return TextComponent(
                          hintText: "Outro documento",
                          initialValue: state.otherDocumentType,
                          onChanged: (documento) => context
                              .read<CreateUpdateBeneficiaryCubit>()
                              .validate(
                                state.copyWith(
                                  otherDocumentType: documento,
                                ),
                              ),
                        );
                      },
                    ),
                    LabelComponent(
                      labelText: LocaleKeys.forwardedService.tr().capitalize,
                    ),
                    FutureBuilder(
                      future: GetIt.I<GetAllForwardedServices>()(),
                      builder: (_, snap) {
                        List<ForwardedServiceEntity>? items;
                        if (snap.hasData) {
                          items = snap.data?.fold((l) => null, (r) => r);
                        }
                        return BlocBuilder<CreateUpdateBeneficiaryCubit,
                            BeneficiaryEntity>(
                          builder: (context, state) {
                            return SelectComponent<ForwardedServiceEntity>(
                              hintText:
                                  LocaleKeys.forwardedServices.tr().capitalize,
                              items: items ?? <ForwardedServiceEntity>[],
                              selectedItem: state.forwardedServiceEntity,
                              itemAsString: (p0) => p0!.name,
                              validator: (item) => Validation.selectValidation(
                                  LocaleKeys.forwardedServices.tr(), item),
                              onChanged: (forwardedServices) => context
                                  .read<CreateUpdateBeneficiaryCubit>()
                                  .validate(
                                    state.copyWith(
                                      forwardedServiceEntity: forwardedServices,
                                    ),
                                  ),
                            );
                          },
                        );
                      },
                    ),
                    const LabelComponent(labelText: "Outro serviço"),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return TextComponent(
                          hintText: "Outro serviço",
                          initialValue: state.otherForwardedService,
                          onChanged: (servico) => context
                              .read<CreateUpdateBeneficiaryCubit>()
                              .validate(
                                state.copyWith(
                                  otherForwardedService: servico,
                                ),
                              ),
                        );
                      },
                    ),
                    const LabelComponent(labelText: "Especificar Serviço"),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return TextComponent(
                          hintText: "Especificar Serviço",
                          initialValue: state.specifyForwardedService,
                          onChanged: (specifyService) => context
                              .read<CreateUpdateBeneficiaryCubit>()
                              .validate(
                                state.copyWith(
                                  specifyForwardedService: specifyService,
                                ),
                              ),
                        );
                      },
                    ),
                    const LabelComponent(
                      labelText: "Necessita de acompanhamento domiciliar?",
                    ),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return SelectComponent(
                          hintText: "Necessita de acompanhamento domiciliar?",
                          items: trueFalse,
                          itemAsString: (item) => item!.value,
                          selectedItem: trueFalse.where((element) => element.key == state.homeCare).first,
                          validator: (item) => Validation.selectValidation(
                              "Necessita de acompanhamento domiciliar?", item),
                          onChanged: (homeCare) => context
                              .read<CreateUpdateBeneficiaryCubit>()
                              .validate(
                                state.copyWith(
                                  homeCare: homeCare!.key,
                                ),
                              ),
                        );
                      },
                    ),
                    LabelComponent(
                      labelText: LocaleKeys.purposeOfVisit.tr().capitalize,
                    ),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return TextComponent(
                          hintText: LocaleKeys.purposeOfVisit.tr().capitalize,
                          initialValue: state.visitProposes,
                          onChanged: (visitProposes) => context
                              .read<CreateUpdateBeneficiaryCubit>()
                              .validate(
                                  state.copyWith(visitProposes: visitProposes)),
                        );
                      },
                    ),
                    const LabelComponent(
                        labelText: "Data que foi recebida pelo serviço"),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return DateTimeComponent(
                          onChanged: (datareceived) => context
                              .read<CreateUpdateBeneficiaryCubit>()
                              .validate(
                                state.copyWith(
                                  dateReceived: datareceived ?? DateTime.now(),
                                ),
                              ),
                          initialValue: state.dateReceived,
                        );
                      },
                    ),
                    const LabelComponent(labelText: "Resolveu o seu problema?"),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return SelectComponent(
                          hintText: "Resolveu o seu problema?",
                          items: trueFalse,
                          itemAsString: (item) => item!.value,
                          selectedItem: trueFalse.where((element) => element.key == state.status).first,
                          onChanged: (status) => context
                              .read<CreateUpdateBeneficiaryCubit>()
                              .validate(
                                state.copyWith(
                                  status: status!.key,
                                ),
                              ),
                        );
                      },
                    ),
                    const LabelComponent(labelText: ""),
                  ]),
            ),
          ),
          bottomNavigationBar:
              BlocBuilder<BeneficiaryCrudBottomBarIndexCubit, int>(
            builder: (context, state) {
              return BottomNavyBar(
                selectedIndex:
                    context.read<BeneficiaryCrudBottomBarIndexCubit>().state,
                showElevation: true,
                itemCornerRadius: 14,
                curve: Curves.easeIn,
                onItemSelected: (index) {
                  context
                      .read<BeneficiaryCrudBottomBarIndexCubit>()
                      .changeIndex(index);
                  if (index == 0) {
                    context
                        .read<BeneficiaryCrudBottomBarIndexCubit>()
                        .changeIndex(-1);
                    Navigator.of(context).pop();
                  } else if (index == 1) {
                    if (formKey.currentState != null &&
                        formKey.currentState!.validate() == true) {
                      context.read<CreateUpdateBeneficiaryCubit>().store(
                          context.read<CreateUpdateBeneficiaryCubit>().state);
                      Navigator.of(context).pop();
                    }
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
                      LocaleKeys.storeResource.tr(
                        namedArgs: {'resource': ''},
                      ),
                    ),
                    activeColor: Colors.green,
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
