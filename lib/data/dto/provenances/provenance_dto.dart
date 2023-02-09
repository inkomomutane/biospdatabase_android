import 'package:ulid4d/ulid4d.dart';

import '../../../core/inject.dart';
import '../../../domain/entity/provenances/provenance_entity.dart';
import '../../datasource/isar/model/provenances/provenance.dart';

abstract class ProvenanceDto {
  static ProvenanceEntity fromIsar(Provenance? provenance) => ProvenanceEntity(
        ulid: ULID.fromString(provenance!.ulid),
        name: provenance.name,
        id: provenance.id,
      );
  static Provenance fromEntity(ProvenanceEntity? provenanceEntity) =>
      Provenance()
        ..name = provenanceEntity!.name
        ..ulid = provenanceEntity.ulid.toString()
        ..id = provenanceEntity.id;

  static Provenance fromGraphql(Map<String,dynamic> graphql) => Provenance()
    ..name = graphql['name']..ulid =  Inject.toUppercase(graphql['ulid'] as String);
}
