part of 'counter_bloc.dart';

class CounterState extends Equatable {
  const CounterState({required this.counter});

  factory CounterState.initial() => const CounterState(counter: 0);

  final int counter;

  @override
  List<Object> get props => [counter];

  @override
  String toString() => 'CounterState(counter: $counter)';

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}
