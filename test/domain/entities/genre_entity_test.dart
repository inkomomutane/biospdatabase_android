import 'package:biosp/domain/entity/genres/genre_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ulid4d/ulid4d.dart';
void main(){

  late ULID  ulid;
  late String name;
  late GenreEntity genreEntity;

  setUp((){
    ulid = ULID.nextULID();
    name = "Male";
    genreEntity = GenreEntity(ulid: ulid,name: name);
  });

  test('it should create an genre entity', () {
    expect(genreEntity.ulid.toString(),ulid.toString());
    expect(genreEntity.name,name);
  });
}