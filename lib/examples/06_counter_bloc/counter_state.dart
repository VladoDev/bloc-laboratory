import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int counter;
  const CounterState(this.counter);
  @override
  List<Object?> get props => [counter];
}

class CounterInitial extends CounterState {
  const CounterInitial(super.counter);
}

class CounterLoading extends CounterState {
  const CounterLoading(super.counter);
}
