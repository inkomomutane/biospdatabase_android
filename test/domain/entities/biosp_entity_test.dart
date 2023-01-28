import 'package:biosp/domain/entity/biosps/biosp_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ulid4d/ulid4d.dart';

void main() {
  late final ULID ulid;
  late final String name;
  late final String projectName;
  late final BiospEntity biospEntity;

  setUp(() {
    ulid = ULID.nextULID();
    name = "Maputo";
    projectName = "Akulo Akulo 3";
    biospEntity = BiospEntity(ulid: ulid, name: name, projectName: projectName);
  });

  test('it should create an biosp entity', () {
    expect(biospEntity.ulid.toString(), ulid.toString());
    expect(biospEntity.name, name);
    expect(biospEntity.projectName, projectName);
  });
}
