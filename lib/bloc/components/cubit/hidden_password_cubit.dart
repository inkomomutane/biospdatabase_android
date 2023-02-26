import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hidden_password_state.dart';

class HiddenPasswordCubit extends Cubit<HiddenPasswordState> {
  HiddenPasswordCubit() : super(HiddenPasswordInitial());
}
