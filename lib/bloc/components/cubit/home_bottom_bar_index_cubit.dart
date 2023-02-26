import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBottomBarIndexCubit extends Cubit<int> {
  HomeBottomBarIndexCubit() : super(0);
  void changeIndex(int index) => emit(index);
}
