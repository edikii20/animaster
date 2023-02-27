import 'dart:async';

import 'package:aniquiz/src/domain/repositories/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:email_auth/email_auth.dart';

part 'confirm_email_code_page_state.dart';

class ConfirmEmailCodePageCubit extends Cubit<ConfirmEmailCodePageState> {
  final AuthenticationRepository _authenticationRepository;
  final String? _email;
  ConfirmEmailCodePageCubit({
    required AuthenticationRepository authenticationRepository,
    required String? email,
  })  : _authenticationRepository = authenticationRepository,
        _email = email,
        super(ConfirmEmailCodePageState(
          seconds: 60,
          status: ConfirmEmailCodePageStatus.initial,
        )) {
    sendEmailCode();
  }

  void sendEmailCode() {
    // if (_email != null) {
    //   _authenticationRepository.sendOTP(email: _email!, otpLength: 4);
    //   changeResendCodeTimer();
    // }
  }

  void onTapConfirm({required String userOtp}) {
    // if (_email != null) {
    //   emit(state.copyWith(status: ConfirmEmailCodePageStatus.loading));
    //   if (_authenticationRepository.validateOTP(
    //       email: _email!, userOtp: userOtp)) {
    //     emit(state.copyWith(status: ConfirmEmailCodePageStatus.complete));
    //   } else {
    //     emit(state.copyWith(status: ConfirmEmailCodePageStatus.failure));
    //   }
    // }
  }

  Future<void> changeResendCodeTimer() async {
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
