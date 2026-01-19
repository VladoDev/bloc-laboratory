import 'package:equatable/equatable.dart';

class UsersStatsState extends Equatable {
  final String name;
  final bool isLoading;

  const UsersStatsState(this.name, this.isLoading);

  @override
  List<Object?> get props => [name, isLoading];
}
