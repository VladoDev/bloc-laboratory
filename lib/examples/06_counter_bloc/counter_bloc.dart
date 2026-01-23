import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:bloc_lab/examples/06_counter_bloc/counter_event.dart';
import 'package:bloc_lab/examples/06_counter_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    on<CounterIncremented>((event, emit) async {
      emit(CounterLoading(state.counter));
      await Future.delayed(const Duration(seconds: 1));
      emit(CounterState(state.counter + 1));
    }, transformer: droppable());

    on<CounterDecremented>((event, emit) {
      emit(CounterState(state.counter - 1));
    });

    on<CounterReset>((event, emit) {
      emit(const CounterState(0));
    });
  }
}
