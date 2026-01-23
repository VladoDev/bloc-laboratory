import 'package:bloc_lab/examples/02_color_cubit/color_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorPage extends StatelessWidget {
  const ColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorView();
  }
}

class ColorView extends StatelessWidget {
  const ColorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Color Cubit")),
      body: Center(
        child: BlocBuilder<ColorCubit, Color>(
          builder: (context, state) {
            return Container(color: state, height: 100, width: 100);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "red",
            backgroundColor: Colors.red,
            onPressed: () {
              context.read<ColorCubit>().setToRed();
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "green",
            backgroundColor: Colors.green,
            onPressed: () {
              context.read<ColorCubit>().setToGreen();
            },
          ),
        ],
      ),
    );
  }
}
