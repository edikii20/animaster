part of '../login_page.dart';

class _LogInPageRegistrationFormWidget extends StatefulWidget {
  const _LogInPageRegistrationFormWidget({
    Key? key,
    required Size sizeRatio,
  })  : _sizeRatio = sizeRatio,
        super(key: key);

  final Size _sizeRatio;

  @override
  State<_LogInPageRegistrationFormWidget> createState() =>
      _LogInPageRegistrationFormWidgetState();
}

class _LogInPageRegistrationFormWidgetState
    extends State<_LogInPageRegistrationFormWidget> {
  final _emailInputController = TextEditingController();
  final _passwordInputController = TextEditingController();
  final _passwordInputFocusNode = FocusNode();

  @override
  void dispose() {
    _emailInputController.dispose();
    _passwordInputController.dispose();
    _passwordInputFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 120 * widget._sizeRatio.height),
        children: [
          Text(
            'Email',
            style: AppTextStyles.semiBold(
              fontSize: 15,
              color: AppColors.mainBlack,
            ),
          ),
          StartPagesInputWidget(
            inputController: _emailInputController,
            inputType: StartPagesInputType.email,
            nextFocusNode: _passwordInputFocusNode,
          ),
          SizedBox(height: 30 * widget._sizeRatio.height),
          Text(
            'Password',
            style: AppTextStyles.semiBold(
              fontSize: 15,
              color: AppColors.mainBlack,
            ),
          ),
          StartPagesInputWidget(
            inputController: _passwordInputController,
            inputType: StartPagesInputType.password,
            currentFocusNode: _passwordInputFocusNode,
          ),
          SizedBox(height: 30 * widget._sizeRatio.height),
          _LogInPageRememberMeWidgest(sizeRatio: widget._sizeRatio),
          SizedBox(height: 40 * widget._sizeRatio.height),
          _LogInPageDividerWidgest(sizeRatio: widget._sizeRatio),
          SizedBox(height: 30 * widget._sizeRatio.height),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => context.push('/forgot_password'),
              child: Text(
                'Forgot password?',
                style: AppTextStyles.bold(
                  fontSize: 18,
                  color: AppColors.mainPurple,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
