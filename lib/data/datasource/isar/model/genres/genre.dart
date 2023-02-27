import 'package:isar/isar.dart';

import '../../../../../core/inject.dart';

part 'genre.g.dart';

@collection
class Genre {
  @Index(unique: true,replace:true)
  late String ulid;
  Id get id => Inject.fastHash(ulid);
  late String name;
}
