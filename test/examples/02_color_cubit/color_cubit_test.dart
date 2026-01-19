import 'package:bloc_lab/examples/02_color_cubit/color_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Color cubit tests', () {
    test('Initial value is red', () {
      expect(ColorCubit().state, Colors.red);
    });

    blocTest(
      'When green button is tapped the value should change to green',
      build: () => ColorCubit(),
      act: (cubit) => cubit.setToGreen(),
      expect: () => [Colors.green],
    );

    blocTest(
      'When green button is tapped the value should change to red',
      build: () => ColorCubit(),
      act: (cubit) => cubit.setToRed(),
      expect: () => [Colors.red],
    );

    blocTest(
      'When multiple times the button is tapped the value should change multiple times',
      build: () => ColorCubit(),
      act: (cubit) {
        cubit.setToRed();
        cubit.setToGreen();
        cubit.setToRed();
      },
      expect: () => [Colors.red, Colors.green, Colors.red],
    );
  });
}
