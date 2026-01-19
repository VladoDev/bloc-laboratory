import 'package:bloc_lab/examples/01_counter_cubit/counter_page.dart';
import 'package:bloc_lab/examples/02_color_cubit/color_page.dart';
import 'package:bloc_lab/examples/03_user_cubit/user_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc & Cubit Lab')),
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
        ],
      ),
    );
  }
}
