import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorCubit extends Cubit<Color> {
  ColorCubit() : super(Colors.black);

  void setToRed() => emit(Colors.red);
  void setToGreen() => emit(Colors.green);
}
