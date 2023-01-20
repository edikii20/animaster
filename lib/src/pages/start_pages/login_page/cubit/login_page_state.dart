part of 'login_page_cubit.dart';

class LogInPageState {
  final bool rememberMe;
  LogInPageState({
    required this.rememberMe,
  });

  LogInPageState copyWith({
    bool? rememberMe,
  }) {
    return LogInPageState(
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  @override
  bool operator ==(covariant LogInPageState other) {
    if (identical(this, other)) return true;

    return other.rememberMe == rememberMe;
  }

  @override
  int get hashCode => rememberMe.hashCode;
}
