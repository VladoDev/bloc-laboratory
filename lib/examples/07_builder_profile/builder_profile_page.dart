import 'package:bloc_lab/examples/07_builder_profile/builder_profile_bloc.dart';
import 'package:bloc_lab/examples/07_builder_profile/builder_profile_event.dart';
import 'package:bloc_lab/examples/07_builder_profile/builder_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuilderProfilePage extends StatelessWidget {
  const BuilderProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Builder")),
      body: BlocConsumer<BuilderProfileBloc, BuilderProfileState>(
        listener: (context, state) {
          if (state is BuilderProfileData) {
            print(state.name);
          } else if (state is BuilderProfileError) {
            print("error");
          }
        },
        builder: (context, state) {
          if (state is BuilderProfileLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BuilderProfileData) {
            return Center(child: Text(state.name));
          } else if (state is BuilderProfileError) {
            return Center(child: Text("Failure"));
          } else {
            return Center(child: Text("Init data"));
          }
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.green,
            heroTag: "faSuccess",
            onPressed: () {
              context.read<BuilderProfileBloc>().add(
                BuilderProfileFetchData("login"),
              );
            },
            child: Icon(Icons.check),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            backgroundColor: Colors.red,
            heroTag: "faError",
            onPressed: () {
              context.read<BuilderProfileBloc>().add(
                BuilderProfileFetchData(""),
              );
            },
            child: Icon(Icons.error_sharp),
          ),
        ],
      ),
    );
  }
}
