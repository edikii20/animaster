import 'package:aniquiz/src/domain/repositories/authentication_repository.dart';
import 'package:aniquiz/src/utils/input_validation_mixin.dart';
import 'package:aniquiz/src/utils/start_pages_input_widget.dart';
import 'package:bloc/bloc.dart';

part 'login_page_state.dart';

class LogInPageCubit extends Cubit<LogInPageState> with InputValidationMixin {
  final AuthenticationRepository _authenticationRepository;

  LogInPageCubit({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(LogInPageInitialState());

  Future<void> onTapSignin({
    required String email,
    required String password,
  }) async {
    emit(LogInPageLoadingState());
    try {
      if (_loginFormValidation(email: email, password: password)) {
        await _authenticationRepository.logInWithEmailAndPassword(
          email: email,
          password: password,
        );

        emit(LogInPageCompleteState());
      } else {
        emit(LogInPageFailureState(
            message: 'The data written in the form is incorrect.'));
      }
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(LogInPageFailureState(message: e.message));
    }
  }

  bool _loginFormValidation({
    required String email,
    required String password,
  }) {
    return validate(
          inputType: StartPagesInputType.email,
          inputText: email,
        ) &&
        validate(
          inputType: StartPagesInputType.password,
          inputText: password,
        );
  }
}
