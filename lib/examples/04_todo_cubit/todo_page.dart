import 'package:bloc_lab/examples/04_todo_cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => TodoCubit(), child: TodoView());
  }
}

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo List Cubit")),
      body: BlocBuilder<TodoCubit, List<String>>(
        builder: (context, state) {
          return state.isEmpty
              ? Center(child: Text("No tasks", style: TextStyle(fontSize: 18)))
              : ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text(state[index]));
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TodoCubit>().addTask("New task");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
