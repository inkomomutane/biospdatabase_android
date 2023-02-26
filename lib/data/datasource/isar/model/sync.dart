import 'package:isar/isar.dart';

part 'sync.g.dart'

@collection()
class Sync {
  Id? id;
  @Index(unique: true)
  late String ulid;
  late String name;
  late String projectName;
}
