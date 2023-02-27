import 'package:isar/isar.dart';

import '../../../../../core/inject.dart';

part 'purpose_of_visit.g.dart';

@collection
class PurposeOfVisit {
  @Index(unique: true,replace:true)
  late String ulid;
  Id get id => Inject.fastHash(ulid);
  late String name;
}
