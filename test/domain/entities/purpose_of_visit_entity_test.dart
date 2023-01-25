import 'package:biosp/domain/entity/purposes_of_visit/purpose_of_visit_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ulid4d/ulid4d.dart';
void main(){

  late ULID  ulid;
  late String name;
  late PurposeOfVisitEntity purposeOfVisitEntity;

  setUp((){
    ulid = ULID.nextULID();
    name = "Bring ID";
    purposeOfVisitEntity = PurposeOfVisitEntity(ulid: ulid,name: name);
  });

  test('it should create an purpose of visit entity', () {
    expect(purposeOfVisitEntity.ulid.toString(),ulid.toString());
    expect(purposeOfVisitEntity.name,name);
  });
}