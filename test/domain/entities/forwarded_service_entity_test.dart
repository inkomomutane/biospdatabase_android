import 'package:biosp/domain/entity/forwarded_services/forwarded_service_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ulid4d/ulid4d.dart';
void main(){

  late ULID  ulid;
  late String name;
  late ForwardedServiceEntity forwardedServiceEntity;

  setUp((){
    ulid = ULID.nextULID();
    name = "DIC";
    forwardedServiceEntity = ForwardedServiceEntity(ulid: ulid,name: name);
  });

  test('it should create an forwarded service entity', () {
    expect(forwardedServiceEntity.ulid.toString(),ulid.toString());
    expect(forwardedServiceEntity.name,name);
  });
}