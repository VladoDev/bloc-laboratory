import 'package:bloc_lab/examples/06_counter_bloc/counter_bloc.dart';
import 'package:bloc_lab/examples/06_counter_bloc/counter_event.dart';
import 'package:bloc_lab/examples/06_counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CounterBlocView();
  }
}

class CounterBlocView extends StatelessWidget {
  const CounterBlocView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("Counter BLoC")),
          body: Center(
            child: Text(
              state.counter.toString(),
              style: TextStyle(fontSize: 50),
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: "blocIncrement",
                onPressed: () {
                  context.read<CounterBloc>().add(CounterIncremented());
                },
                child: state is CounterLoading
                    ? Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: const CircularProgressIndicator(),
                      )
                    : Icon(Icons.add),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                heroTag: "blocDecrement",
                onPressed: () {
                  context.read<CounterBloc>().add(CounterDecremented());
                },
                child: Icon(Icons.remove),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                heroTag: "blocReset",
                onPressed: () {
                  context.read<CounterBloc>().add(CounterReset());
                },
                child: Icon(Icons.restore),
              ),
            ],
          ),
        );
      },
    );
  }
}
