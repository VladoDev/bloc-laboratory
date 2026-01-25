import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthStatus { authenticated, unauthenticated }

class AuthCubit extends Cubit<AuthStatus> {
  AuthCubit() : super(AuthStatus.unauthenticated);
  void logout() => emit(AuthStatus.unauthenticated);
  void login() => emit(AuthStatus.authenticated);
}
