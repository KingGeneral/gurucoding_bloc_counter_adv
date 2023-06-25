part of 'counter_bloc.dart';

enum Status { initial, loading, loaded, error }

class CounterState extends Equatable {
  const CounterState(
      {required this.counter, required this.status, required this.error});

  factory CounterState.initial() => const CounterState(
        counter: 0,
        status: Status.initial,
        error: '',
      );

  final int counter;
  final Status status;
  final String error;

  @override
  List<Object> get props => [counter, status, error];

  @override
  String toString() =>
      'CounterState(counter: $counter, status: $status, error: $error)';

  CounterState copyWith({
    int? counter,
    Status? status,
    String? error,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
