import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_state.dart';
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 0,incremented: false));
  void increment() => emit(CounterState(counter: state.counter + 1 ,incremented: true));
}
