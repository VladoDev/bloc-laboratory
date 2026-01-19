import 'package:bloc_lab/examples/05_user_stats_cubit/users_stats_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserStatsCubit extends Cubit<UsersStatsState> {
  UserStatsCubit() : super(UsersStatsState('', false));

  Future fetchUser() async {
    emit(UsersStatsState('', true));
    await Future.delayed(const Duration(seconds: 5));
    emit(UsersStatsState('Vladimir', false));
  }
}
