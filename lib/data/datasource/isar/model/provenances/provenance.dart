import 'package:isar/isar.dart';

part 'provenance.g.dart';

@collection
class Provenance {
  Id id = Isar.autoIncrement;
  late String ulid;
  late String name;
}
