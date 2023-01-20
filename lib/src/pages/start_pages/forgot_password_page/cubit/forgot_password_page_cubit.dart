import 'package:bloc/bloc.dart';

part 'forgot_password_page_state.dart';

class ForgotPasswordPageCubit extends Cubit<ForgotPasswordPageState> {
  ForgotPasswordPageCubit() : super(ForgotPasswordPageInitial());
}
