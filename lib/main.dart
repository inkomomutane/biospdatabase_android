


import 'package:biosp/core/inject.dart';
import 'package:biosp/data/datasource/isar/model/genres/genre.dart';
import 'package:biosp/domain/actions/beneficiary/get_beneficiaries.dart';
import 'package:biosp/domain/repository/get_beneficiaries_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';

void main() {
  Inject.init();
  var isar = GetIt.I.get<Isar>();
  var repo = GetIt.I.get<GetBeneficiariesRepository>();

  isar.writeTxnSync(() =>  isar.genres.putSync(Genre()..ulid = ULID.nextULID().toString()
    ..name = 'code mosh 3'
  ) );



  GetBeneficiaries get = GetBeneficiaries(getBeneficiariesRepository: repo);
  var bens = get();
  bens.then((value) {
    value.fold((l) => null, (r) {
      r.forEach((element) {
        print(element);
      });
    });
  });
}
