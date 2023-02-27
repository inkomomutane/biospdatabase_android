import 'package:ulid4d/ulid4d.dart';

import '../../../core/inject.dart';
import '../../../domain/entity/biosps/biosp_entity.dart';
import '../../datasource/isar/model/biosps/biosp.dart';

abstract class BiospDto {
  static BiospEntity fromIsar(Biosp? biosp) => BiospEntity(
      ulid: ULID.fromString(biosp!.ulid),
      name: biosp.name,
      projectName: biosp.projectName,
      id: biosp.id);

  static Biosp fromEntity(BiospEntity? biospEntity) => Biosp()
    ..name = biospEntity!.name
    ..ulid = biospEntity.ulid.toString()
    ..projectName = biospEntity.projectName
  ;

  static Biosp fromGraphql(Map<String,dynamic> graphql) => Biosp()
    ..name = graphql['name']..ulid =  Inject.toUppercase(graphql['ulid'] as String)
    ..projectName = graphql['project_name'];
}
