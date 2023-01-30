
import 'package:ulid4d/ulid4d.dart';

import '../../../domain/entity/reasons_of_opening_case/reason_of_opening_case_entity.dart';
import '../../datasource/isar/model/reasons_of_opening_case/reason_of_opening_case.dart';
abstract class ReasonOfOpeningCaseDto {
   static ReasonOfOpeningCaseEntity fromIsar(ReasonOfOpeningCase? reasonOfOpeningCase)  => ReasonOfOpeningCaseEntity(ulid: ULID.fromString(reasonOfOpeningCase!.ulid), name: reasonOfOpeningCase.name);
   static ReasonOfOpeningCase fromEntity(ReasonOfOpeningCaseEntity? reasonOfOpeningCaseEntity) => ReasonOfOpeningCase()..name = reasonOfOpeningCaseEntity!.name..ulid = reasonOfOpeningCaseEntity.ulid.toString();
}
