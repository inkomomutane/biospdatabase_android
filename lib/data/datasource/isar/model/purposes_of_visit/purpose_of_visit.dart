import 'package:isar/isar.dart';

part 'purpose_of_visit.g.dart';

@collection
class PurposeOfVisit {
  Id? id;
  @Index(unique: true)
  late String ulid;
  late String name;
}
