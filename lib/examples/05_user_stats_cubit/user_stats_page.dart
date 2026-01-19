import 'package:bloc_lab/examples/05_user_stats_cubit/user_stats_cubit.dart';
import 'package:bloc_lab/examples/05_user_stats_cubit/users_stats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserStatsPage extends StatelessWidget {
  const UserStatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserStatsCubit(),
      child: UserStatsView(),
    );
  }
}

class UserStatsView extends StatelessWidget {
  const UserStatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserStatsCubit, UsersStatsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("User Stats Cubit")),
          body: Center(
            child: Container(
              child: state.isLoading
                  ? CircularProgressIndicator()
                  : Text(state.name, style: TextStyle(fontSize: 30)),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<UserStatsCubit>().fetchUser();
            },
            child: Icon(Icons.download),
          ),
        );
      },
    );
  }
}
