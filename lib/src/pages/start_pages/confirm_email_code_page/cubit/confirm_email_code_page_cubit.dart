import 'dart:async';

import 'package:aniquiz/src/domain/repositories/authentication_repository.dart';
import 'package:bloc/bloc.dart';

part 'confirm_email_code_page_state.dart';

class ConfirmEmailCodePageCubit extends Cubit<ConfirmEmailCodePageState> {
  final AuthenticationRepository _authenticationRepository;
  final String? _email;
  late final Timer _timer;
  ConfirmEmailCodePageCubit({
    required AuthenticationRepository authenticationRepository,
    required String? email,
  })  : _authenticationRepository = authenticationRepository,
        _email = email,
        super(ConfirmEmailCodePageState(seconds: 60));

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
