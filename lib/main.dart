import 'package:bloc_lab/examples/01_counter_cubit/counter_cubit.dart';
import 'package:bloc_lab/examples/02_color_cubit/color_cubit.dart';
import 'package:bloc_lab/examples/03_user_cubit/user_cubit.dart';
import 'package:bloc_lab/examples/04_todo_cubit/todo_cubit.dart';
import 'package:bloc_lab/examples/05_user_stats_cubit/user_stats_cubit.dart';
import 'package:bloc_lab/examples/06_counter_bloc/counter_bloc.dart';
import 'package:bloc_lab/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => ColorCubit()),
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => TodoCubit()),
        BlocProvider(create: (context) => UserStatsCubit()),
        BlocProvider(create: (context) => CounterBloc()),
      ],
      child: MaterialApp(home: const HomePage()),
    ),
  );
}
