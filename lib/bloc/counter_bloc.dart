import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    // DONE: CounterIncrementEvent
    on<CounterIncrementEvent>((event, emit) async {
      // print(state);
      // emit(CounterState(counter: state.counter + 1, status: Status.loading));
      emit(state.copyWith(status: Status.loading, error: ''));
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(counter: state.counter + 1, status: Status.loaded));
      if (state.counter == 3) {
        emit(state.copyWith(status: Status.error, error: 'Status Error'));
      }
    });

    // DONE: CounterDecrementEvent
    on<CounterDecrementEvent>((event, emit) async {
      // print(state);
      // emit(CounterState(counter: state.counter - 1, status: Status.loading));
      emit(state.copyWith(status: Status.loading, error: ''));
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(counter: state.counter - 1, status: Status.loaded));
      if (state.counter == 3) {
        emit(state.copyWith(status: Status.error, error: 'Status Error'));
      }
    });
  }
}
