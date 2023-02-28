import 'package:isar/isar.dart';

import '../../../../core/constants.dart';
import '../../../../core/inject.dart';

part 'sync.g.dart';

@collection
class LWinMapSync {
  @enumerated
  final SyncOperations operation;
  @Index(unique: true, replace: true)
  final String ulid;
  Id get id => Inject.fastHash(ulid);
  final DateTime operationDateTime;
  LWinMapSync({
    required this.operation,
    required this.ulid,
    required this.operationDateTime,
  });
}
