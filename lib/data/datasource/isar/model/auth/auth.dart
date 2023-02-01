import 'package:isar/isar.dart';
part 'auth.g.dart';
@Collection()
class Auth {
  Id id = 1;
  final String name;
  final String email;
  final String token;
  Auth({
    required this.name,
    required this.email,
    required this.token
  });
}
