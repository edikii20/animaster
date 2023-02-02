import 'package:aniquiz/src/utils/start_pages_input_widget.dart';

mixin InputValidationMixin {
  final _emailValidator = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  final _usernameValidator =
      RegExp(r"^(?=[a-zA-Z0-9._]{3,15}$)(?!.*[_.]{2})[^_.].*[^_.]$");
  final _passwordValidator =
      RegExp(r"^[a-zA-Z0-9!#\$%&'\(\)\*\+,-\.\/:;<=>\?@[\]\^_`\{\|}~]{8,30}$");

  bool validate({
    required StartPagesInputType inputType,
    required String inputText,
    String? passwordText,
  }) {
    switch (inputType) {
      case StartPagesInputType.username:
        return _usernameValidator.hasMatch(inputText);
      case StartPagesInputType.email:
        return _emailValidator.hasMatch(inputText);
      case StartPagesInputType.password:
        return _passwordValidator.hasMatch(inputText);
      case StartPagesInputType.confirmPassword:
        return inputText == passwordText;
    }
  }
}
