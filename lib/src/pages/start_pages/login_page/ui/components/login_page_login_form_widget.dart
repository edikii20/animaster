part of '../login_page.dart';

class _LogInPageRegistrationFormWidget extends StatelessWidget {
  const _LogInPageRegistrationFormWidget({
    Key? key,
    required Size sizeRatio,
    required TextEditingController emailInputController,
    required TextEditingController passwordInputController,
    required FocusNode passwordInputFocusNode,
  })  : _sizeRatio = sizeRatio,
        _emailInputController = emailInputController,
        _passwordInputController = passwordInputController,
        _passwordInputFocusNode = passwordInputFocusNode,
        super(key: key);

  final Size _sizeRatio;
  final TextEditingController _emailInputController;
  final TextEditingController _passwordInputController;
  final FocusNode _passwordInputFocusNode;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 120 * _sizeRatio.height),
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
          ),
          SizedBox(height: 40 * _sizeRatio.height),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => context.goNamed('forgot_password'),
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
