
import 'package:ulid4d/ulid4d.dart';

import '../../../domain/entity/purposes_of_visit/purpose_of_visit_entity.dart';
import '../../datasource/isar/model/purposes_of_visit/purpose_of_visit.dart';
abstract class PurposeOfVisitDto {
   static PurposeOfVisitEntity fromIsar(PurposeOfVisit? purposeOfVisit)  => PurposeOfVisitEntity(ulid: ULID.fromString(purposeOfVisit!.ulid), name: purposeOfVisit.name);
   static PurposeOfVisit fromEntity(PurposeOfVisitEntity? purposeOfVisitEntity) => PurposeOfVisit()..name = purposeOfVisitEntity!.name..ulid = purposeOfVisitEntity.ulid.toString();
}