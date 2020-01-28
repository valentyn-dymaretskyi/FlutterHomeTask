class AppState {

  bool isLoading;
  String submittedText;

  AppState({
    this.isLoading = false,
    this.submittedText,
  });

  factory AppState.loading() => new AppState(isLoading: true);

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading}';
  }
}