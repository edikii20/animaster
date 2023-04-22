import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/styles.dart';
import 'input_validation_mixin.dart';

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

class _StartPagesInputWidgetState extends State<StartPagesInputWidget>
    with InputValidationMixin {
  bool? _isCorrectInput;
  bool _isPasswordObscure = true;

  void _createPasswordListener() {
    widget._passwordInputController?.addListener(() {
      if (widget._passwordInputController!.text != '') {
        _inputValidator(text: widget._inputController.text);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget._passwordInputController != null) {
      _createPasswordListener();
    }
  }

  @override
  void dispose() {
    widget._passwordInputController?.removeListener(() {
      _inputValidator(text: widget._inputController.text);
    });
    super.dispose();
  }

  void _inputValidator({required String text}) {
    if (validate(
      inputType: widget._inputType,
      inputText: text,
      passwordText: widget._passwordInputController?.text,
    )) {
      if (_isCorrectInput != true) {
        setState(() {
          _isCorrectInput = true;
        });
      }
    } else {
      if (_isCorrectInput != false) {
        setState(() {
          _isCorrectInput = false;
        });
      }
    }
  }

  void _onTapObscurePassword() {
    setState(() {
      _isPasswordObscure = !_isPasswordObscure;
    });
  }

  Widget? _pickSuffix() {
    if (widget._inputType == StartPagesInputType.password ||
        widget._inputType == StartPagesInputType.confirmPassword) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 12.sp),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 20.sp,
              height: 20.sp,
              child: _isCorrectInput == null
                  ? null
                  : _isCorrectInput!
                      ? Image.asset(
                          'assets/images/correct_icon.png',
                          color: Colors.green,
                        )
                      : Image.asset(
                          'assets/images/incorrect_icon.png',
                          color: Colors.red,
                        ),
            ),
            5.horizontalSpace,
            GestureDetector(
              onTap: () => _onTapObscurePassword(),
              child: Icon(
                _isPasswordObscure
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.mainPurple,
              ),
            ),
          ],
        ),
      );
    } else {
      return _isCorrectInput == null
          ? null
          : Container(
              width: 20.sp,
              height: 20.sp,
              padding: EdgeInsets.symmetric(vertical: 12.sp),
              child: _isCorrectInput!
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
      onChanged: (value) => _inputValidator(text: value),
      onSubmitted: widget._passwordInputController != null
          ? (_) {}
          : (_) => widget._nextFocusNode?.requestFocus(),
      focusNode: widget._currentFocusNode,
      obscureText: _isPasswordObscure &&
          (widget._inputType == StartPagesInputType.password ||
              widget._inputType == StartPagesInputType.confirmPassword),
      textInputAction: widget._nextFocusNode != null
          ? TextInputAction.next
          : TextInputAction.done,
      style: AppTextStyles.bold(
        fontSize: 18.sp,
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
        suffixIcon: _pickSuffix(),
      ),
    );
  }
}
