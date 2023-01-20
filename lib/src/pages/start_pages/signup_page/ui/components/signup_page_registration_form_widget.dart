part of '../signup_page.dart';

class _SignUpPageRegistrationFormWidget extends StatefulWidget {
  const _SignUpPageRegistrationFormWidget({
    Key? key,
    required Size sizeRatio,
  })  : _sizeRatio = sizeRatio,
        super(key: key);

  final Size _sizeRatio;

  @override
  State<_SignUpPageRegistrationFormWidget> createState() =>
      _SignUpPageRegistrationFormWidgetState();
}

class _SignUpPageRegistrationFormWidgetState
    extends State<_SignUpPageRegistrationFormWidget> {
  final _usernameInputController = TextEditingController();
  final _emailInputController = TextEditingController();
  final _passwordInputController = TextEditingController();
  final _emailInputFocusNode = FocusNode();
  final _passwordInputFocusNode = FocusNode();

  @override
  void dispose() {
    _usernameInputController.dispose();
    _emailInputController.dispose();
    _passwordInputController.dispose();
    _emailInputFocusNode.dispose();
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
            'Username',
            style: AppTextStyles.semiBold(
              fontSize: 15,
              color: AppColors.mainBlack,
            ),
          ),
          StartPagesInputWidget(
            inputController: _usernameInputController,
            inputType: StartPagesInputType.username,
            nextFocusNode: _emailInputFocusNode,
          ),
          SizedBox(height: 30 * widget._sizeRatio.height),
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
            currentFocusNode: _emailInputFocusNode,
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
          _SignUpPageRememberMeWidgest(sizeRatio: widget._sizeRatio),
          SizedBox(height: 40 * widget._sizeRatio.height),
          _SignUpPageDividerWidgest(sizeRatio: widget._sizeRatio),
          SizedBox(height: 30 * widget._sizeRatio.height),
          AppButtons.fillBorderedButton(
            fillColor: AppColors.mainButtonWhiteLight,
            borderColor: AppColors.mainDisableDark,
            text: Text(
              'Continue with Google',
              style: AppTextStyles.semiBold(
                fontSize: 15,
                color: AppColors.mainBlack,
              ),
            ),
            width: double.infinity,
            icon: Image.asset('assets/images/google_icon.png'),
            sizeRatio: widget._sizeRatio,
            onTap: () {},
          ),
          SizedBox(height: 30 * widget._sizeRatio.height),
          AppButtons.fillBorderedButton(
            fillColor: AppColors.mainButtonWhiteLight,
            borderColor: AppColors.mainDisableDark,
            text: Text(
              'Continue with Apple',
              style: AppTextStyles.semiBold(
                fontSize: 15,
                color: AppColors.mainBlack,
              ),
            ),
            width: double.infinity,
            icon: Image.asset('assets/images/apple_icon.png'),
            sizeRatio: widget._sizeRatio,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
