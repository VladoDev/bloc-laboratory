import 'package:bloc_lab/examples/01_counter_cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Counter Cubit", () {
    test('Init value must be 0', () {
      expect(CounterCubit().state, 0);
    });

    blocTest(
      'Shold be 1 when increment button is called',
      build: () => CounterCubit(),
      act: (cubit) => cubit.increment(),
      expect: () => [1],
    );

    blocTest<CounterCubit, int>(
      'Should be -1 when decrement buttons is called',
      build: () => CounterCubit(),
      act: (cubit) => cubit.decrement(),
      expect: () => [-1],
    );

    blocTest(
      'Should emit [1,2,1] when increment, increment, decrement buttons are called',
      build: () => CounterCubit(),
      act: (cubit) {
        cubit.increment();
        cubit.increment();
        cubit.decrement();
      },
      expect: () => [1, 2, 1],
    );
  });
}
