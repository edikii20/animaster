import 'package:bloc/bloc.dart';

part 'login_page_state.dart';

class LogInPageCubit extends Cubit<LogInPageState> {
  LogInPageCubit() : super(LogInPageState(rememberMe: false));

  void onTapSignin() {}

  void onTapRememberme() {
    emit(state.copyWith(rememberMe: !state.rememberMe));
  }
}
