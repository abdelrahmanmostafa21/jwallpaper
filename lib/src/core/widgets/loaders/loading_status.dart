// The current status of a loading.
///
/// Used to display a status message in a snack bar.
class LoadingStatus {
  const LoadingStatus({
    required this.message,
    required this.state,
  });

  final String message;
  final LoadingState state;
}

enum LoadingState {
  inProgress,
  successful,
  failed,
}
