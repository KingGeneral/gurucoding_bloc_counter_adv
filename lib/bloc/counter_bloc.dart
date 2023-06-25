import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    // DONE: CounterIncrementEvent
    on<CounterIncrementEvent>((event, emit) {
      emit(CounterState(counter: state.counter + 1));
    });

    // DONE: CounterDecrementEvent
    on<CounterDecrementEvent>((event, emit) {
      emit(CounterState(counter: state.counter - 1));
    });
  }
}
