class LoginState {
  final bool isShowPassword;
  final LoadingState loadingState;
  final bool isAuthed;

  LoginState({
    bool? isShowPassword,
    LoadingState? loadingState,
    bool? isAuthed,
  })  : isShowPassword = isShowPassword ?? false,
        loadingState = loadingState ?? LoadingState.none,
        isAuthed = isAuthed ?? false;

  LoginState copyWith({
    bool? isShowPassword,
    LoadingState? loadingState,
    bool? isAuthed,
  }) {
    return LoginState(
      isShowPassword: isShowPassword ?? this.isShowPassword,
      loadingState: loadingState ?? this.loadingState,
      isAuthed:  isAuthed ?? this.isAuthed,
    );
  }
}

enum LoadingState { none, loading, cancel }
