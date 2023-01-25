import 'dart:math';

import 'package:biosp/core/error_handler.dart';
import 'package:flutter_test/flutter_test.dart';

ErrorHandler<double> errorHandler(){
  try{
    throw const FormatException('test exception');
  }catch(e){
    return ErrorHandler.left(e.toString());
  }
}
ErrorHandler<double> successHandler(){
  try{
    return ErrorHandler.right(1.2);
  }catch(e){
    return ErrorHandler.left(e.toString());
  }
}

void main(){
  test('it should return a string error message on left and respective correct data in right.', () {
    errorHandler().fold((l) => expect(l, 'FormatException: test exception'), (r)  => expect(r,1.2));
    successHandler().fold((l) => expect(l, 'FormatException: test exception'), (r)  => expect(r,1.2));
  });
}