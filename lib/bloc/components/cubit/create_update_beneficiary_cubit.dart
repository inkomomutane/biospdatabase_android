import 'package:biosp/domain/actions/beneficiary/create_beneficiary.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/entity/beneficiaries/beneficiary_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateUpdateBeneficiaryCubit extends Cubit<BeneficiaryEntity> {
  CreateUpdateBeneficiaryCubit() : super(GetIt.I<BeneficiaryEntity>());
  void validate(BeneficiaryEntity beneficiaryEntity) => emit(beneficiaryEntity);

  void store(BeneficiaryEntity beneficiaryEntity) {
      GetIt.I<CreateBeneficiary>()(beneficiaryEntity).then((value){
        value.fold((l) => null, (r) {
          emit(GetIt.I<BeneficiaryEntity>());
        });
      });
  }
}

