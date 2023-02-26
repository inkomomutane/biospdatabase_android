import 'package:flutter_bloc/flutter_bloc.dart';

class BeneficiaryCrudBottomBarIndexCubit extends Cubit<int> {
  BeneficiaryCrudBottomBarIndexCubit() : super(-1);
  void changeIndex(int index) => emit(index);
}
