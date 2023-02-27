import 'package:isar/isar.dart';

import '../../../../../core/inject.dart';

part 'reason_of_opening_case.g.dart';

@collection
class ReasonOfOpeningCase {
  @Index(unique: true,replace:true)
  late String ulid;
  Id get id => Inject.fastHash(ulid);
  late String name;
}
