import 'package:biosp/domain/entity/document_types/document_type_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ulid4d/ulid4d.dart';
void main(){

  late ULID  ulid;
  late String name;
  late DocumentTypeEntity documentTypeEntity;

  setUp((){
    ulid = ULID.nextULID();
    name = "ID";
    documentTypeEntity = DocumentTypeEntity(ulid: ulid,name: name);
  });

  test('it should create an document type entity', () {
    expect(documentTypeEntity.ulid.toString(),ulid.toString());
    expect(documentTypeEntity.name,name);
  });
}