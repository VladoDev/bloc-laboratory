import 'package:bloc_lab/examples/03_user_cubit/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState(name: "Sin nombre", age: 0));

  void updateUser(String newName, int newAge) {
    emit(UserState(name: newName, age: newAge));
  }
}
