import 'package:biosp/domain/entity/reasons_of_opening_case/reason_of_opening_case_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ulid4d/ulid4d.dart';
void main(){

  late ULID  ulid;
  late String name;
  late ReasonOfOpeningCaseEntity reasonOfOpeningCaseEntity;

  setUp((){
    ulid = ULID.nextULID();
    name = "Social protection";
    reasonOfOpeningCaseEntity = ReasonOfOpeningCaseEntity(ulid: ulid,name: name);
  });

  test('it should create an genre entity', () {
    expect(reasonOfOpeningCaseEntity.ulid.toString(),ulid.toString());
    expect(reasonOfOpeningCaseEntity.name,name);
  });
}