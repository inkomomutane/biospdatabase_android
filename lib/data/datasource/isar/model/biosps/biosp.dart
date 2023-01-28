import 'package:isar/isar.dart';

part 'biosp.g.dart';

@collection
class Biosp {
  Id id = Isar.autoIncrement;
  late String ulid;
  late String name;
  late String projectName;
}
