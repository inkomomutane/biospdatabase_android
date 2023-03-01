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
    final trueFalse = [
      TrueFalseEntity(key: true, value: LocaleKeys.yes.tr().capitalize ),
      TrueFalseEntity(key: true, value: LocaleKeys.no.tr().capitalize )
    ];

    return BlocBuilder<LanguageCubit, LanguageEntity>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.createResource.tr(namedArgs: {
              'resource': LocaleKeys.beneficiary.tr().toLowerCase()
            }).capitalize),
          ),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelComponent(labelText: LocaleKeys.fullName.tr().capitalize),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return TextComponent(
                          hintText: LocaleKeys.fullName.tr().capitalize,
                          initialValue: state.fullName,
                          validator: (fullName) => Validation.textValidation(
                              LocaleKeys.fullName.tr().capitalize, fullName ?? ''),
                          onChanged: (fullName) => context
                              .read<CreateUpdateBeneficiaryCubit>()
                              .validate(
                                state.copyWith(fullName: fullName),
                              ),
                        );
                      },
                    ),
                    LabelComponent(labelText: LocaleKeys.neighborhoods.tr().capitalize),
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
                              hintText: LocaleKeys.neighborhoods.tr().capitalize,
                              items: items ?? <BiospEntity>[],
                              validator: (item) => Validation.selectValidation(
                                  LocaleKeys.neighborhoods.tr().capitalize, item),
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
                              items: items?.map((genre) => genre.copyWith(name: genre.name.toLowerCase().tr()) ).toList() ?? <GenreEntity>[],
                              validator: (item) => Validation.selectValidation(
                                  LocaleKeys.genres.tr().capitalize, item),
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
                     LabelComponent(
                      labelText: LocaleKeys.frequency.tr().capitalize,
                    ),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return NumberComponent(
                          hintText: LocaleKeys.frequency.tr().capitalize,
                          initialValue: state.numberOfVisits.toString(),
                          validator: (item) => Validation.numberValidation(
                              LocaleKeys.frequency.tr().capitalize, item ?? ""),
                          onChanged: (frequency) => context
                              .read<CreateUpdateBeneficiaryCubit>()
                              .validate(
                                state.copyWith(
                                    numberOfVisits: int.parse(frequency)),
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
                                  LocaleKeys.provenances.tr().capitalize, item),
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
                    LabelComponent(
                      labelText: LocaleKeys.birthDate.tr().capitalize,
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
                     LabelComponent(
                      labelText: LocaleKeys.contact.tr().capitalize,
                    ),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return PhoneNumberComponent(
                          hintText:  LocaleKeys.contact.tr().capitalize,
                          validator: (contact) => Validation.phoneValidation(
                              LocaleKeys.contact.tr().capitalize, contact ?? ''),
                          initialValue: state.phone,
                          onChanged: (contact) => context
                              .read<CreateUpdateBeneficiaryCubit>()
                              .validate(
                                state.copyWith(
                                  phone: contact,
                                ),
                              ),
                        );
                      },
                    ),
                    LabelComponent(
                      labelText:  LocaleKeys.serviceDate.tr().capitalize,
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
                                  LocaleKeys.purposesOfVisit.tr().capitalize, item),
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
                    LabelComponent(
                      labelText:  LocaleKeys.profTrainingSpec.tr().capitalize,
                    ),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return TextComponent(
                          hintText:
                              LocaleKeys.profTrainingSpec.tr().capitalize
                          ,
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
                                  LocaleKeys.reasonsOfOpeningCase.tr().capitalize, item),
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
                     LabelComponent(labelText: LocaleKeys.otherReason.tr().capitalize),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return TextComponent(
                          hintText: LocaleKeys.otherReason.tr().capitalize,
                          initialValue: state.otherReasonOfOpeningCase,
                          onChanged: (otherReason) => context
                              .read<CreateUpdateBeneficiaryCubit>()
                              .validate(
                                state.copyWith(
                                    otherReasonOfOpeningCase: otherReason),
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
                                  LocaleKeys.documentNeeded.tr().capitalize, item),
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
                    LabelComponent(labelText: LocaleKeys.otherDoc.tr().capitalize),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return TextComponent(
                          hintText: LocaleKeys.otherDoc.tr().capitalize,
                          initialValue: state.otherDocumentType,
                          onChanged: (doc) => context
                              .read<CreateUpdateBeneficiaryCubit>()
                              .validate(
                                state.copyWith(
                                  otherDocumentType: doc,
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
                                  LocaleKeys.forwardedServices.tr().capitalize, item),
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
                    LabelComponent(labelText: LocaleKeys.otherService.tr().capitalize),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return TextComponent(
                          hintText: LocaleKeys.otherService.tr().capitalize,
                          initialValue: state.otherForwardedService,
                          onChanged: (service) => context
                              .read<CreateUpdateBeneficiaryCubit>()
                              .validate(
                                state.copyWith(
                                  otherForwardedService: service,
                                ),
                              ),
                        );
                      },
                    ),
                     LabelComponent(labelText: LocaleKeys.serviceSpec.tr().capitalize ),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return TextComponent(
                          hintText: LocaleKeys.serviceSpec.tr().capitalize,
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
                    LabelComponent(
                      labelText:LocaleKeys.needsHomeFollowUp.tr().capitalize,
                    ),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return SelectComponent(
                          hintText:LocaleKeys.needsHomeFollowUp.tr().capitalize,
                          items: trueFalse,
                          itemAsString: (item) => item!.value,
                          selectedItem: trueFalse.where((element) => element.key == state.homeCare).first,
                          validator: (item) => Validation.selectValidation(
                              LocaleKeys.needsHomeFollowUp.tr().capitalize, item),
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
                    LabelComponent(
                        labelText: LocaleKeys.receivedDate.tr().capitalize),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return DateTimeComponent(
                          onChanged: (dataReceived) => context
                              .read<CreateUpdateBeneficiaryCubit>()
                              .validate(
                                state.copyWith(
                                  dateReceived: dataReceived ?? DateTime.now(),
                                ),
                              ),
                          initialValue: state.dateReceived,
                        );
                      },
                    ),
                     LabelComponent(labelText:LocaleKeys.problemSolved.tr().capitalize),
                    BlocBuilder<CreateUpdateBeneficiaryCubit,
                        BeneficiaryEntity>(
                      builder: (context, state) {
                        return SelectComponent(
                          hintText: LocaleKeys.problemSolved.tr().capitalize,
                          items: trueFalse,
                          itemAsString: (item) => item!.value,
                          validator: (item) => Validation.selectValidation(
                            LocaleKeys.problemSolved.tr().capitalize, item),
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
                      ).capitalize,
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
