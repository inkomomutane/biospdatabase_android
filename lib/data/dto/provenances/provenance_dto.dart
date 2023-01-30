import 'package:ulid4d/ulid4d.dart';

import '../../../domain/entity/provenances/provenance_entity.dart';
import '../../datasource/isar/model/provenances/provenance.dart';
abstract class ProvenanceDto {
   static ProvenanceEntity fromIsar(Provenance? provenance)  => ProvenanceEntity(ulid: ULID.fromString(provenance!.ulid), name: provenance.name);
   static Provenance fromEntity(ProvenanceEntity? provenanceEntity) => Provenance()..name = provenanceEntity!.name..ulid = provenanceEntity.ulid.toString();
}
