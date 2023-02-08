part of 'forgot_password_page_cubit.dart';

abstract class ForgotPasswordPageState {}

class ForgotPasswordPageInitialState extends ForgotPasswordPageState {}

class ForgotPasswordPageCompleteState extends ForgotPasswordPageState {}

class ForgotPasswordPageFailureState extends ForgotPasswordPageState {
  final String message;

  ForgotPasswordPageFailureState({required this.message});
}

class ForgotPasswordPageLoadingState extends ForgotPasswordPageState {}
