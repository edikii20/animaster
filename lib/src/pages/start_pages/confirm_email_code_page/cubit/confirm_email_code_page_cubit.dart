import 'package:bloc/bloc.dart';

part 'confirm_email_code_page_state.dart';

class ConfirmEmailCodePageCubit extends Cubit<ConfirmEmailCodePageState> {
  ConfirmEmailCodePageCubit() : super(ConfirmEmailCodePageState(seconds: 60));

  void changeResendCodeTimer() async {
    if (state.seconds > 0) {
      await Future.delayed(const Duration(seconds: 1));
      if (!isClosed) {
        emit(state.copyWith(seconds: state.seconds - 1));
      }
    } else {
      if (!isClosed) {
        emit(state.copyWith(seconds: 60));
      }
    }
  }
}
