part of 'login_page_cubit.dart';

abstract class LogInPageState {}

class LogInPageCompleteState extends LogInPageState {}

class LogInPageInitialState extends LogInPageState {}

class LogInPageFailureState extends LogInPageState {
  final String message;

  LogInPageFailureState({required this.message});
}

class LogInPageLoadingState extends LogInPageState {}
