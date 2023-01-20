import 'package:bloc/bloc.dart';

part 'signup_page_state.dart';

class SignUpPageCubit extends Cubit<SignUpPageState> {
  SignUpPageCubit() : super(SignUpPageState(rememberMe: false));

  void onTapSignup() {}

  void onTapRememberme() {
    emit(state.copyWith(rememberMe: !state.rememberMe));
  }
}
