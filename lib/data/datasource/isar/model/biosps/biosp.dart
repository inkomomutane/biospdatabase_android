import 'package:isar/isar.dart';

import '../../../../../core/inject.dart';

part 'biosp.g.dart';

@collection
class Biosp {
  @Index(unique: true,replace:true)
  late String ulid;
  Id get id => Inject.fastHash(ulid);
  late String name;
  late String projectName;
}
