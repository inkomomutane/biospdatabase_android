import 'package:isar/isar.dart';

part 'provenance.g.dart';

@collection
class Provenance {
  Id? id;
  @Index(unique: true, replace: true)
  late String ulid;
  late String name;
}
