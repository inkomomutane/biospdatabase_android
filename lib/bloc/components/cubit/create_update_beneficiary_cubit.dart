import 'package:get_it/get_it.dart';

import '../../../domain/entity/beneficiaries/beneficiary_entity.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_update_beneficiary_state.dart';
part 'create_update_beneficiary_cubit.freezed.dart';

class CreateUpdateBeneficiaryCubit extends Cubit<BeneficiaryEntity> {
  CreateUpdateBeneficiaryCubit() : super(GetIt.I<BeneficiaryEntity>());
  void validate(BeneficiaryEntity beneficiaryEntity) => emit(beneficiaryEntity);

  void store(BeneficiaryEntity beneficiaryEntity) {
    debugPrint(
      beneficiaryEntity.props.toString(),
    );
  }
}

