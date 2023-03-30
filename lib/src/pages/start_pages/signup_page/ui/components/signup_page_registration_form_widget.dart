part of '../signup_page.dart';

class _SignUpPageRegistrationFormWidget extends StatelessWidget {
  const _SignUpPageRegistrationFormWidget({
    Key? key,
    required TextEditingController usernameInputController,
    required TextEditingController emailInputController,
    required TextEditingController passwordInputController,
    required TextEditingController confirmPasswordInputController,
    required FocusNode emailInputFocusNode,
    required FocusNode passwordInputFocusNode,
    required FocusNode confirmPasswordFocusNode,
  })  : _usernameInputController = usernameInputController,
        _emailInputController = emailInputController,
        _passwordInputController = passwordInputController,
        _confirmPasswordInputController = confirmPasswordInputController,
        _emailInputFocusNode = emailInputFocusNode,
        _passwordInputFocusNode = passwordInputFocusNode,
        _confirmPasswordFocusNode = confirmPasswordFocusNode,
        super(key: key);

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
        padding: EdgeInsets.only(bottom: 120.h),
        children: [
          Text(
            'Username',
            style: AppTextStyles.semiBold(
              fontSize: 15.sp,
              color: AppColors.mainBlack,
            ),
          ),
          StartPagesInputWidget(
            inputController: _usernameInputController,
            inputType: StartPagesInputType.username,
            nextFocusNode: _emailInputFocusNode,
          ),
          SizedBox(height: 20.h),
          Text(
            'Email',
            style: AppTextStyles.semiBold(
              fontSize: 15.sp,
              color: AppColors.mainBlack,
            ),
          ),
          StartPagesInputWidget(
            inputController: _emailInputController,
            inputType: StartPagesInputType.email,
            currentFocusNode: _emailInputFocusNode,
            nextFocusNode: _passwordInputFocusNode,
          ),
          SizedBox(height: 20.h),
          Text(
            'Password',
            style: AppTextStyles.semiBold(
              fontSize: 15.sp,
              color: AppColors.mainBlack,
            ),
          ),
          StartPagesInputWidget(
            inputController: _passwordInputController,
            inputType: StartPagesInputType.password,
            currentFocusNode: _passwordInputFocusNode,
            nextFocusNode: _confirmPasswordFocusNode,
          ),
          SizedBox(height: 20.h),
          Text(
            'Confirm Password',
            style: AppTextStyles.semiBold(
              fontSize: 15.sp,
              color: AppColors.mainBlack,
            ),
          ),
          StartPagesInputWidget(
            inputController: _confirmPasswordInputController,
            passwordInputController: _passwordInputController,
            inputType: StartPagesInputType.confirmPassword,
            currentFocusNode: _confirmPasswordFocusNode,
          ),
          SizedBox(height: 40.h),
          const _SignUpPageDividerWidgest(),
          SizedBox(height: 30.h),
          AppButtons.fillBorderedButton(
            fillColor: AppColors.mainButtonWhiteLight,
            borderColor: AppColors.mainDisableDark,
            child: Text(
              'Continue with Google',
              style: AppTextStyles.semiBold(
                fontSize: 15.sp,
                color: AppColors.mainBlack,
              ),
            ),
            width: double.infinity,
            icon: Image.asset('assets/images/google_icon.png'),
            onTap: () {},
          ),
          SizedBox(height: 30.h),
          AppButtons.fillBorderedButton(
            fillColor: AppColors.mainButtonWhiteLight,
            borderColor: AppColors.mainDisableDark,
            child: Text(
              'Continue with Apple',
              style: AppTextStyles.semiBold(
                fontSize: 15.sp,
                color: AppColors.mainBlack,
              ),
            ),
            width: double.infinity,
            icon: Image.asset('assets/images/apple_icon.png'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
