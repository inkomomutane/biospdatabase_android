import 'package:ulid4d/ulid4d.dart';

import '../../../domain/entity/biosps/biosp_entity.dart';
import '../../datasource/isar/model/biosps/biosp.dart';

abstract class BiospDto {
  static BiospEntity fromIsar(Biosp? biosp) => BiospEntity(
      ulid: ULID.fromString(biosp!.ulid),
      name: biosp.name,
      projectName: biosp.projectName);

  static Biosp fromEntity(BiospEntity? biospEntity) => Biosp()
    ..name = biospEntity!.name
    ..ulid = biospEntity.ulid.toString()
    ..projectName = biospEntity.projectName
      ..id = biospEntity.id;
}
