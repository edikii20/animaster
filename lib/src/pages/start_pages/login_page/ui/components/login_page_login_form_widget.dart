part of '../login_page.dart';

class _LogInPageRegistrationFormWidget extends StatelessWidget {
  const _LogInPageRegistrationFormWidget({
    Key? key,
    required TextEditingController emailInputController,
    required TextEditingController passwordInputController,
    required FocusNode passwordInputFocusNode,
  })  : _emailInputController = emailInputController,
        _passwordInputController = passwordInputController,
        _passwordInputFocusNode = passwordInputFocusNode,
        super(key: key);

  final TextEditingController _emailInputController;
  final TextEditingController _passwordInputController;
  final FocusNode _passwordInputFocusNode;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 120.sp),
        children: [
          Text(
            'Email',
            style: AppTextStyles.semiBold(
              fontSize: 16.sp,
              color: AppColors.mainBlack,
            ),
          ),
          StartPagesInputWidget(
            inputController: _emailInputController,
            inputType: StartPagesInputType.email,
            nextFocusNode: _passwordInputFocusNode,
          ),
          20.verticalSpace,
          Text(
            'Password',
            style: AppTextStyles.semiBold(
              fontSize: 16.sp,
              color: AppColors.mainBlack,
            ),
          ),
          StartPagesInputWidget(
            inputController: _passwordInputController,
            inputType: StartPagesInputType.password,
            currentFocusNode: _passwordInputFocusNode,
          ),
          40.verticalSpace,
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => AppNavigation.goToForgotPassword(context: context),
              child: AppTextWidget(
                text: 'Forgot password?',
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.mainPurple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
