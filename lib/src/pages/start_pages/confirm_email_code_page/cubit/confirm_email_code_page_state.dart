part of 'confirm_email_code_page_cubit.dart';

class ConfirmEmailCodePageState {
  final int seconds;
  ConfirmEmailCodePageState({
    required this.seconds,
  });

  ConfirmEmailCodePageState copyWith({
    int? seconds,
  }) {
    return ConfirmEmailCodePageState(
      seconds: seconds ?? this.seconds,
    );
  }

  @override
  bool operator ==(covariant ConfirmEmailCodePageState other) {
    if (identical(this, other)) return true;

    return other.seconds == seconds;
  }

  @override
  int get hashCode => seconds.hashCode;
}
