import 'package:aniquiz/src/domain/repositories/authentication_repository.dart';
import 'package:bloc/bloc.dart';

part 'new_password_page_state.dart';

class NewPasswordPageCubit extends Cubit<NewPasswordPageState> {
  final AuthenticationRepository _authenticationRepository;
  NewPasswordPageCubit({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(NewPasswordPageState(rememberMe: false));

  void onTapRememberme() {
    emit(state.copyWith(rememberMe: !state.rememberMe));
  }
}
