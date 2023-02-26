import 'package:isar/isar.dart';

part 'genre.g.dart';

@collection
class Genre {
  Id? id;
  @Index(unique: true, replace: true)
  late String ulid;
  late String name;
}
