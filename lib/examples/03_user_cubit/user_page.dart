import 'package:bloc_lab/examples/03_user_cubit/user_cubit.dart';
import 'package:bloc_lab/examples/03_user_cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return UserView();
  }
}

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("User Cubit")),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.name, style: TextStyle(fontSize: 50)),
                Text(
                  "La edad es: ${state.age}",
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<UserCubit>().updateUser("Vladimir", 30);
            },
            child: const Icon(Icons.update),
          ),
        );
      },
    );
  }
}
