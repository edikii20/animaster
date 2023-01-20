part of 'new_password_page_cubit.dart';

class NewPasswordPageState {
  final bool rememberMe;
  NewPasswordPageState({
    required this.rememberMe,
  });

  NewPasswordPageState copyWith({
    bool? rememberMe,
  }) {
    return NewPasswordPageState(
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  @override
  bool operator ==(covariant NewPasswordPageState other) {
    if (identical(this, other)) return true;

    return other.rememberMe == rememberMe;
  }

  @override
  int get hashCode => rememberMe.hashCode;
}
