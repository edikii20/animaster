part of '../signup_page.dart';

class _SignUpPageRegistrationFormWidget extends StatelessWidget {
  const _SignUpPageRegistrationFormWidget({
    Key? key,
    required Size sizeRatio,
    required TextEditingController usernameInputController,
    required TextEditingController emailInputController,
    required TextEditingController passwordInputController,
    required TextEditingController confirmPasswordInputController,
    required FocusNode emailInputFocusNode,
    required FocusNode passwordInputFocusNode,
    required FocusNode confirmPasswordFocusNode,
  })  : _sizeRatio = sizeRatio,
        _usernameInputController = usernameInputController,
        _emailInputController = emailInputController,
        _passwordInputController = passwordInputController,
        _confirmPasswordInputController = confirmPasswordInputController,
        _emailInputFocusNode = emailInputFocusNode,
        _passwordInputFocusNode = passwordInputFocusNode,
        _confirmPasswordFocusNode = confirmPasswordFocusNode,
        super(key: key);

  final Size _sizeRatio;
  final TextEditingController _usernameInputController;
  final TextEditingController _emailInputController;
  final TextEditingController _passwordInputController;
  final TextEditingController _confirmPasswordInputController;
  final FocusNode _emailInputFocusNode;
  final FocusNode _passwordInputFocusNode;
  final FocusNode _confirmPasswordFocusNode;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 120 * _sizeRatio.height),
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
          SizedBox(height: 20 * _sizeRatio.height),
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
          SizedBox(height: 20 * _sizeRatio.height),
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
            nextFocusNode: _confirmPasswordFocusNode,
          ),
          SizedBox(height: 20 * _sizeRatio.height),
          Text(
            'Confirm Password',
            style: AppTextStyles.semiBold(
              fontSize: 15,
              color: AppColors.mainBlack,
            ),
          ),
          StartPagesInputWidget(
            inputController: _confirmPasswordInputController,
            passwordInputController: _passwordInputController,
            inputType: StartPagesInputType.confirmPassword,
            currentFocusNode: _confirmPasswordFocusNode,
          ),
          SizedBox(height: 40 * _sizeRatio.height),
          _SignUpPageDividerWidgest(sizeRatio: _sizeRatio),
          SizedBox(height: 30 * _sizeRatio.height),
          AppButtons.fillBorderedButton(
            fillColor: AppColors.mainButtonWhiteLight,
            borderColor: AppColors.mainDisableDark,
            child: Text(
              'Continue with Google',
              style: AppTextStyles.semiBold(
                fontSize: 15,
                color: AppColors.mainBlack,
              ),
            ),
            width: double.infinity,
            icon: Image.asset('assets/images/google_icon.png'),
            sizeRatio: _sizeRatio,
            onTap: () {},
          ),
          SizedBox(height: 30 * _sizeRatio.height),
          AppButtons.fillBorderedButton(
            fillColor: AppColors.mainButtonWhiteLight,
            borderColor: AppColors.mainDisableDark,
            child: Text(
              'Continue with Apple',
              style: AppTextStyles.semiBold(
                fontSize: 15,
                color: AppColors.mainBlack,
              ),
            ),
            width: double.infinity,
            icon: Image.asset('assets/images/apple_icon.png'),
            sizeRatio: _sizeRatio,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
