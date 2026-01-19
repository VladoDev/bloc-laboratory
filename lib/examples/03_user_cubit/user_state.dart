import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  final String name;
  final int age;

  const UserState({required this.name, required this.age});

  @override
  List<Object> get props => [name, age];
}
