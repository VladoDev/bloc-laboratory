import 'package:bloc_lab/examples/01_counter_cubit/counter_page.dart';
import 'package:bloc_lab/examples/02_color_cubit/color_page.dart';
import 'package:bloc_lab/examples/03_user_cubit/user_page.dart';
import 'package:bloc_lab/examples/04_todo_cubit/todo_page.dart';
import 'package:bloc_lab/examples/05_user_stats_cubit/user_stats_page.dart';
import 'package:bloc_lab/examples/06_counter_bloc/auth_cubit.dart';
import 'package:bloc_lab/examples/06_counter_bloc/counter_bloc.dart';
import 'package:bloc_lab/examples/06_counter_bloc/counter_bloc_page.dart';
import 'package:bloc_lab/examples/06_counter_bloc/counter_event.dart';
import 'package:bloc_lab/examples/07_builder_profile/builder_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authStatus = context.watch<AuthCubit>().state;
    return BlocListener<AuthCubit, AuthStatus>(
      listener: (context, state) {
        if (state == AuthStatus.unauthenticated) {
          context.read<CounterBloc>().add(CounterReset());
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Sesion finalizada")));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bloc & Cubit Lab'),
          actions: [
            IconButton(
              icon: Icon(
                authStatus == AuthStatus.authenticated
                    ? Icons.verified_user
                    : Icons.block,
              ),
              onPressed: () {
                if (authStatus == AuthStatus.authenticated) {
                  context.read<AuthCubit>().logout();
                } else {
                  context.read<AuthCubit>().login();
                }
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text("01.- Counter Cubit"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CounterPage()),
              ),
            ),
            ListTile(
              title: Text("02.- Color Cubit"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ColorPage()),
              ),
            ),
            ListTile(
              title: Text("03.- User Cubit"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const UserPage()),
              ),
            ),
            ListTile(
              title: Text("04.- Todo List Cubit"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TodoPage()),
              ),
            ),
            ListTile(
              title: Text("05.- User Stats Cubit"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const UserStatsPage()),
              ),
            ),
            ListTile(
              title: Text("06.- Counter BLoC"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CounterBlocPage()),
              ),
            ),
            ListTile(
              title: Text("07.- Builder BLoC"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BuilderProfilePage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
