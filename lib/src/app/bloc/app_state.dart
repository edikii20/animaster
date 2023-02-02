part of 'app_bloc.dart';

enum AuthStatus { authenticated, unauthenticated, loading }

class AppState {
  final AuthStatus authStatus;
  AppState({
    required this.authStatus,
  });

  AppState copyWith({
    AuthStatus? authStatus,
  }) {
    return AppState(
      authStatus: authStatus ?? this.authStatus,
    );
  }

  @override
  bool operator ==(covariant AppState other) {
    if (identical(this, other)) return true;

    return other.authStatus == authStatus;
  }

  @override
  int get hashCode => authStatus.hashCode;
}
