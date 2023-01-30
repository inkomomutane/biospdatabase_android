import 'package:isar/isar.dart';

part 'document_type.g.dart';

@collection
class DocumentType {
  Id? id;
  @Index(unique: true)
  late String ulid;
  late String name;
}
