import 'package:aniquiz/src/domain/repositories/authentication_repository.dart';
import 'package:bloc/bloc.dart';

import '../../../../utils/widgets/common/input_validation_mixin.dart';
import '../../../../utils/widgets/common/start_pages_input_widget.dart';

part 'forgot_password_page_state.dart';

class ForgotPasswordPageCubit extends Cubit<ForgotPasswordPageState>
    with InputValidationMixin {
  final AuthenticationRepository _authenticationRepository;
  ForgotPasswordPageCubit({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(ForgotPasswordPageInitialState());

  Future<void> checkUserEmail({required String email}) async {
    emit(ForgotPasswordPageLoadingState());
    if (validate(
      inputType: StartPagesInputType.email,
      inputText: email,
    )) {
      if (await _authenticationRepository.userExist(email: email)) {
        emit(ForgotPasswordPageCompleteState());
      } else {
        emit(ForgotPasswordPageFailureState(
            message: 'The user with this email doesn\'t exist.'));
      }
    } else {
      emit(ForgotPasswordPageFailureState(
          message: 'The data written in the form is incorrect.'));
    }
  }
}
