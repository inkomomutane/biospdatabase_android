import 'package:isar/isar.dart';

part 'document_type.g.dart';

@collection
class DocumentType {
  Id id = Isar.autoIncrement;
  late String ulid;
  late String name;
}
