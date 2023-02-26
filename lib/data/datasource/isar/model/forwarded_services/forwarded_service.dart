import 'package:isar/isar.dart';
part 'forwarded_service.g.dart';

@collection
class ForwardedService {
  Id? id;
  @Index(unique: true, replace: true)
  late String ulid;
  late String name;
}
