import 'package:isar/isar.dart';

import '../../../../../core/inject.dart';
part 'forwarded_service.g.dart';

@collection
class ForwardedService {
  @Index(unique: true,replace:true)
  late String ulid;
  Id get id => Inject.fastHash(ulid);
  late String name;
}
