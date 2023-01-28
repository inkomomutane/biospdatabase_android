import 'package:isar/isar.dart';

part 'reason_of_opening_case.g.dart';

@collection
class ReasonOfOpeningCase {
  Id id = Isar.autoIncrement;
  late String ulid;
  late String name;
}
