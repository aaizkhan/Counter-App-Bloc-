import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterInitial> {
  CounterCubit() : super(CounterInitial(myCounter: 0));

  void incrementCounter() =>
      emit(CounterInitial(myCounter: state.myCounter + 1, isIncremented: true));
  void decrementCounter() => emit(
      CounterInitial(myCounter: state.myCounter - 1, isIncremented: false));
}
