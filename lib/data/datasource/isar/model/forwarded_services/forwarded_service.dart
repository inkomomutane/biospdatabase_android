import 'package:isar/isar.dart';
part 'forwarded_service.g.dart';

@collection
class ForwardedService {
  Id id = Isar.autoIncrement;
  late String ulid;
  late String name;
}
