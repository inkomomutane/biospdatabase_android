import 'package:biosp/domain/entity/provenances/provenance_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ulid4d/ulid4d.dart';
void main(){

  late ULID  ulid;
  late String name;
  late ProvenanceEntity provenanceEntity;

  setUp((){
    ulid = ULID.nextULID();
    name = "Community";
    provenanceEntity = ProvenanceEntity(ulid: ulid,name: name);
  });

  test('it should create an provenance entity', () {
    expect(provenanceEntity.ulid.toString(),ulid.toString());
    expect(provenanceEntity.name,name);
  });
}