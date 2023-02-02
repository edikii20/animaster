import 'package:aniquiz/src/domain/repositories/authentication_repository.dart';
import 'package:bloc/bloc.dart';

part 'forgot_password_page_state.dart';

class ForgotPasswordPageCubit extends Cubit<ForgotPasswordPageState> {
  final AuthenticationRepository _authenticationRepository;
  ForgotPasswordPageCubit({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(ForgotPasswordPageInitial());

  Future<void> sendOTPCode({required String email}) async {
    await _authenticationRepository.sendOTP(email: email);
  }
}
