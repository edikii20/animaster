import 'dart:async';
import 'package:aniquiz/src/domain/repositories/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/widgets/common/input_validation_mixin.dart';
import '../../../../utils/widgets/common/start_pages_input_widget.dart';

part 'signup_page_state.dart';

class SignUpPageCubit extends Cubit<SignUpPageState> with InputValidationMixin {
  final AuthenticationRepository _authenticationRepository;

  SignUpPageCubit({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(SignUpPageInitialState());

  Future<void> onAlertDialogNotVerifiedDismissed({
    required String email,
    required String password,
  }) async {
    try {
      await _authenticationRepository.currentFirebaseUser?.delete();
    } catch (e) {
      await _authenticationRepository.reLogInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _authenticationRepository.currentFirebaseUser?.delete();
    }
  }

  void sendEmailVerificationMail() {
    _authenticationRepository.currentFirebaseUser?.sendEmailVerification();
  }

  Future<void> checkEmailVerification() async {
    await _authenticationRepository.currentFirebaseUser?.reload();
    if (_authenticationRepository.currentFirebaseUser?.emailVerified == true) {
      emit(SignUpPageCompleteState());
    }
  }

  void onCompleteSignup({
    required String uid,
    required String name,
    required String email,
    required String password,
  }) {
    _authenticationRepository.createUser(
      uid: uid,
      name: name,
      email: email,
      password: password,
    );
  }

  Future<void> onTapSignup({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      if (_signupFormValidation(
        username: username,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      )) {
        emit(SignUpPageLoadingState());
        await _authenticationRepository.signUp(
          username: username,
          email: email,
          password: password,
        );
        emit(SignUpPageNotVerifiedState());
      } else {
        emit(SignUpPageFailureState(
            message: 'The data written in the form is incorrect.'));
      }
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(SignUpPageFailureState(message: e.message));
    }
  }

  bool _signupFormValidation({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    return validate(
          inputType: StartPagesInputType.username,
          inputText: username,
        ) &&
        validate(
          inputType: StartPagesInputType.email,
          inputText: email,
        ) &&
        validate(
          inputType: StartPagesInputType.password,
          inputText: password,
        ) &&
        validate(
          inputType: StartPagesInputType.confirmPassword,
          passwordText: password,
          inputText: confirmPassword,
        );
  }
}
