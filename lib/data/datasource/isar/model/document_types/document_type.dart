import 'package:isar/isar.dart';

import '../../../../../core/inject.dart';

part 'document_type.g.dart';

@collection
class DocumentType {
  @Index(unique: true,replace:true)
  late String ulid;
  Id get id => Inject.fastHash(ulid);
  late String name;
}
