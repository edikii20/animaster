import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/text_styles.dart';

enum StartPagesInputType { username, email, password, confirmPassword }

class StartPagesInputWidget extends StatefulWidget {
  const StartPagesInputWidget({
    Key? key,
    required TextEditingController inputController,
    FocusNode? currentFocusNode,
    FocusNode? nextFocusNode,
    TextEditingController? passwordInputController,
    required StartPagesInputType inputType,
  })  : _inputController = inputController,
        _currentFocusNode = currentFocusNode,
        _nextFocusNode = nextFocusNode,
        _passwordInputController = passwordInputController,
        _inputType = inputType,
        super(key: key);

  final TextEditingController _inputController;
  final TextEditingController? _passwordInputController;
  final FocusNode? _currentFocusNode;
  final FocusNode? _nextFocusNode;
  final StartPagesInputType _inputType;

  @override
  State<StartPagesInputWidget> createState() => _StartPagesInputWidgetState();
}

class _StartPagesInputWidgetState extends State<StartPagesInputWidget> {
  bool? isCorrectInput;
  bool isPasswordObscure = true;

  void inputValidator({required String text}) {
    switch (widget._inputType) {
      case StartPagesInputType.username:
        if (text.length > 4) {
          if (isCorrectInput != true) {
            setState(() {
              isCorrectInput = true;
            });
          }
        } else {
          if (isCorrectInput != false) {
            setState(() {
              isCorrectInput = false;
            });
          }
        }
        break;
      case StartPagesInputType.email:
        if (text.length > 4) {
          if (isCorrectInput != true) {
            setState(() {
              isCorrectInput = true;
            });
          }
        } else {
          if (isCorrectInput != false) {
            setState(() {
              isCorrectInput = false;
            });
          }
        }
        break;
      case StartPagesInputType.password:
        if (text.length > 4) {
          if (isCorrectInput != true) {
            setState(() {
              isCorrectInput = true;
            });
          }
        } else {
          if (isCorrectInput != false) {
            setState(() {
              isCorrectInput = false;
            });
          }
        }
        break;
      case StartPagesInputType.confirmPassword:
        if (widget._passwordInputController?.text ==
            widget._inputController.text) {
          if (isCorrectInput != true) {
            setState(() {
              isCorrectInput = true;
            });
          }
        } else {
          if (isCorrectInput != false) {
            setState(() {
              isCorrectInput = false;
            });
          }
        }
        break;
    }
  }

  void onTapObscurePassword() {
    setState(() {
      isPasswordObscure = !isPasswordObscure;
    });
  }

  Widget? pickSuffix() {
    if (widget._inputType == StartPagesInputType.password ||
        widget._inputType == StartPagesInputType.confirmPassword) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: isCorrectInput == null
                  ? null
                  : isCorrectInput!
                      ? Image.asset(
                          'assets/images/correct_icon.png',
                          color: Colors.green,
                        )
                      : Image.asset(
                          'assets/images/incorrect_icon.png',
                          color: Colors.red,
                        ),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () => onTapObscurePassword(),
              child: Icon(
                isPasswordObscure
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.mainPurple,
              ),
            ),
          ],
        ),
      );
    } else {
      return isCorrectInput == null
          ? null
          : Container(
              width: 24,
              height: 24,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: isCorrectInput!
                  ? Image.asset(
                      'assets/images/correct_icon.png',
                      color: Colors.green,
                    )
                  : Image.asset(
                      'assets/images/incorrect_icon.png',
                      color: Colors.red,
                    ),
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget._inputController,
      onChanged: (value) => inputValidator(text: value),
      onSubmitted: (_) => widget._nextFocusNode?.requestFocus(),
      focusNode: widget._currentFocusNode,
      obscureText: isPasswordObscure &&
          (widget._inputType == StartPagesInputType.password ||
              widget._inputType == StartPagesInputType.confirmPassword),
      textInputAction: widget._nextFocusNode != null
          ? TextInputAction.next
          : TextInputAction.done,
      style: AppTextStyles.bold(
        fontSize: 18,
        color: AppColors.mainBlack,
      ),
      cursorColor: AppColors.mainBlack,
      cursorRadius: const Radius.circular(100),
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.mainBlack,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.mainPurple,
          ),
        ),
        suffixIcon: pickSuffix(),
      ),
    );
  }
}
