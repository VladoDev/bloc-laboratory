abstract class BuilderProfileEvent {}

class BuilderProfileFetchData extends BuilderProfileEvent {
  final String userId;
  BuilderProfileFetchData(this.userId);
}
