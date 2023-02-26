import '../../../domain/entity/beneficiaries/beneficiary_entity.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ulid4d/ulid4d.dart';

part 'create_update_beneficiary_state.dart';
part 'create_update_beneficiary_cubit.freezed.dart';

class CreateUpdateBeneficiaryCubit extends Cubit<BeneficiaryEntity> {
  CreateUpdateBeneficiaryCubit()
      : super(
          BeneficiaryEntity(
            biospEntity: null,
            ulid: ULID.nextULID(),
            genreEntity: null,
            birthDate: DateTime.now(),
            serviceDate: DateTime.now(),
            dateReceived: DateTime.now(),
            provenanceEntity: null,
            reasonOfOpeningCaseEntity: null,
            documentTypeEntity: null,
            forwardedServiceEntity: null,
            purposeOfVisitEntity: null,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            specifyForwardedService: '',
          ),
        );
  void validate(BeneficiaryEntity beneficiaryEntity) => emit(beneficiaryEntity);

  void store(BeneficiaryEntity beneficiaryEntity) {
    debugPrint(beneficiaryEntity.props.toString());
  }
}
