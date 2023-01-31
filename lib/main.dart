import 'package:get_it/get_it.dart';

import 'core/inject.dart';
import 'domain/actions/beneficiary/get_beneficiaries.dart';
import 'domain/repository/get_beneficiaries_repository.dart';

void main() {
  Inject.init();
  var repo = GetIt.I.get<GetBeneficiariesRepository>();
  GetBeneficiaries get = GetBeneficiaries(getBeneficiariesRepository: repo);
  var bens = get();

  bens.then((value) {
    value.fold((l) => null, (r) {
      // ignore: unused_local_variable
      for (var element in r) {
        
      }
    });
  });

}
