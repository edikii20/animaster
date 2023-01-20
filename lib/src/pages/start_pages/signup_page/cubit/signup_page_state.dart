part of 'signup_page_cubit.dart';

class SignUpPageState {
  final bool rememberMe;
  SignUpPageState({
    required this.rememberMe,
  });

  SignUpPageState copyWith({
    bool? rememberMe,
  }) {
    return SignUpPageState(
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  @override
  bool operator ==(covariant SignUpPageState other) {
    if (identical(this, other)) return true;

    return other.rememberMe == rememberMe;
  }

  @override
  int get hashCode => rememberMe.hashCode;
}
