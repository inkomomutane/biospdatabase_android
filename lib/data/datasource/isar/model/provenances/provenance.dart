import 'package:isar/isar.dart';

import '../../../../../core/inject.dart';

part 'provenance.g.dart';

@collection
class Provenance {
  @Index(unique: true,replace:true)
  late String ulid;
  Id get id => Inject.fastHash(ulid);
  late String name;
}
