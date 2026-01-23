import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CounterIncremented extends CounterEvent {}

class CounterDecremented extends CounterEvent {}

class CounterReset extends CounterEvent {}
