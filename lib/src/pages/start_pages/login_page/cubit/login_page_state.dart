part of 'login_page_cubit.dart';

enum LogInStatus { complete, loading, failure, uncomplete }

class LogInPageState {
  final bool rememberMe;
  final LogInStatus logInStatus;
  LogInPageState({
    required this.rememberMe,
    required this.logInStatus,
  });

  LogInPageState copyWith({
    bool? rememberMe,
    LogInStatus? logInStatus,
  }) {
    return LogInPageState(
      rememberMe: rememberMe ?? this.rememberMe,
      logInStatus: logInStatus ?? this.logInStatus,
    );
  }

  @override
  bool operator ==(covariant LogInPageState other) {
    if (identical(this, other)) return true;

    return other.rememberMe == rememberMe && other.logInStatus == logInStatus;
  }

  @override
  int get hashCode => rememberMe.hashCode ^ logInStatus.hashCode;
}
