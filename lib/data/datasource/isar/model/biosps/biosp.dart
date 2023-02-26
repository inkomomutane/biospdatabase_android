import 'package:isar/isar.dart';

part 'biosp.g.dart';

@collection
class Biosp {
  Id? id;
  @Index(unique: true, replace: true)
  late String ulid;
  late String name;
  late String projectName;
}
