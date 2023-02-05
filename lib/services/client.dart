import 'package:biosp/core/error_handler.dart';

abstract class Client<T> {
   Future<ErrorHandler<T>> call();
}
