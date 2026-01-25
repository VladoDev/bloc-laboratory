import 'package:bloc_lab/examples/07_builder_profile/builder_profile_event.dart';
import 'package:bloc_lab/examples/07_builder_profile/builder_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuilderProfileBloc
    extends Bloc<BuilderProfileEvent, BuilderProfileState> {
  BuilderProfileBloc() : super(BuilderProfileData("Init")) {
    on<BuilderProfileFetchData>((event, emit) async {
      emit(BuilderProfileLoading());
      await Future.delayed(Duration(seconds: 3));
      if (event.userId == "login") {
        emit(BuilderProfileData("Success"));
      } else {
        emit(BuilderProfileError("error"));
      }
    });
  }
}
