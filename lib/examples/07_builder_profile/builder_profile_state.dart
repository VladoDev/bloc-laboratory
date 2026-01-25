abstract class BuilderProfileState {}

class BuilderProfileLoading extends BuilderProfileState {}

class BuilderProfileData extends BuilderProfileState {
  final String name;
  BuilderProfileData(this.name);
}

class BuilderProfileError extends BuilderProfileState {
  final String error;
  BuilderProfileError(this.error);
}
