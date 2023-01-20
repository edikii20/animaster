import 'package:bloc/bloc.dart';

part 'new_password_page_state.dart';

class NewPasswordPageCubit extends Cubit<NewPasswordPageState> {
  NewPasswordPageCubit() : super(NewPasswordPageState(rememberMe: false));

  void onTapRememberme() {
    emit(state.copyWith(rememberMe: !state.rememberMe));
  }
}
