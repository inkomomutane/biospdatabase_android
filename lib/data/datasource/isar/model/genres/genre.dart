import 'package:isar/isar.dart';
part 'genre.g.dart';

@collection
class Genre {
  Id id = Isar.autoIncrement;
  late String ulid;
  late String name;
}
