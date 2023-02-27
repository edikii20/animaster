part of 'confirm_email_code_page_cubit.dart';

enum ConfirmEmailCodePageStatus { complete, initial, failure, loading }

class ConfirmEmailCodePageState {
  final int seconds;
  final ConfirmEmailCodePageStatus status;
  ConfirmEmailCodePageState({
    required this.seconds,
    required this.status,
  });

  ConfirmEmailCodePageState copyWith({
    int? seconds,
    ConfirmEmailCodePageStatus? status,
  }) {
    return ConfirmEmailCodePageState(
      seconds: seconds ?? this.seconds,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(covariant ConfirmEmailCodePageState other) {
    if (identical(this, other)) return true;

    return other.seconds == seconds && other.status == status;
  }

  @override
  int get hashCode => seconds.hashCode ^ status.hashCode;
}
