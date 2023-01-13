import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_page_event.dart';
part 'signup_page_state.dart';

class SignUpPageBloc extends Bloc<SignUpPageEvent, SignUpPageState> {
  SignUpPageBloc() : super(SignUpPageInitial()) {
    on<SignUpPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
