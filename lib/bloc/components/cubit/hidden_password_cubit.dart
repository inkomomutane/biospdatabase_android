
import 'package:flutter_bloc/flutter_bloc.dart';

import 'hidden_password_state.dart';

class HiddenPasswordCubit extends Cubit<HiddenPasswordState> {
  HiddenPasswordCubit() : super( const HiddenPasswordState());
  void change() =>  emit(state.copyWith(hidden: !state.hidden ));
}
