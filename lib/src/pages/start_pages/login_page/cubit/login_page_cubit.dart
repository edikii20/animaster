import 'package:aniquiz/src/domain/repositories/authentication_repository.dart';
import 'package:bloc/bloc.dart';

part 'login_page_state.dart';

class LogInPageCubit extends Cubit<LogInPageState> {
  final AuthenticationRepository _authenticationRepository;

  LogInPageCubit({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(LogInPageState(
          rememberMe: false,
          logInStatus: LogInStatus.uncomplete,
        ));

  Future<void> onTapSignin() async {
    emit(state.copyWith(logInStatus: LogInStatus.loading));
    try {
      await _authenticationRepository.logInWithEmailAndPassword(
          email: 'edikii20@mail.ru', password: '08222730');

      emit(state.copyWith(logInStatus: LogInStatus.complete));
    } catch (e) {
      emit(state.copyWith(logInStatus: LogInStatus.failure));
    }
  }

  void onTapRememberme() {
    emit(state.copyWith(rememberMe: !state.rememberMe));
  }
}
