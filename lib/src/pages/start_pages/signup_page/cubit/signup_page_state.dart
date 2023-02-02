part of 'signup_page_cubit.dart';

abstract class SignUpPageState {}

class SignUpPageCompleteState extends SignUpPageState {}

class SignUpPageInitialState extends SignUpPageState {}

class SignUpPageFailureState extends SignUpPageState {
  final String message;

  SignUpPageFailureState({required this.message});
}

class SignUpPageLoadingState extends SignUpPageState {}

class SignUpPageNotVerifiedState extends SignUpPageState {}
