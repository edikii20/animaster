import 'package:aniquiz/src/app/app_navigation.dart';
import 'package:aniquiz/src/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../utils/widgets/common/app_buttons.dart';
import '../../../../utils/widgets/common/app_text_widget.dart';
import '../../../../utils/widgets/common/start_pages_input_widget.dart';
import '../../../../utils/widgets/common/start_pages_title_widget.dart';

class NewPasswordPageWidget extends StatefulWidget {
  const NewPasswordPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<NewPasswordPageWidget> createState() => _NewPasswordPageWidgetState();
}

class _NewPasswordPageWidgetState extends State<NewPasswordPageWidget> {
  final _passwordInputController = TextEditingController();
  final _confirmPasswordInputController = TextEditingController();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordInputController.dispose();
    _confirmPasswordInputController.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AppNavigation.goToForgotPassword(context: context);
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: false,
        floatingActionButton: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          height: 60.sp,
          child: AppButtons.fillBorderedButton(
            fillColor: AppColors.mainPurple,
            borderColor: AppColors.mainPurpleDark,
            child: AppTextWidget(
              text: 'Continue',
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
            width: double.infinity,
            onTap: () {},
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.sp,
              right: 20.sp,
              top: 30.sp,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppButtons.goBackButton(
                    onPressed: () =>
                        AppNavigation.goToForgotPassword(context: context)),
                40.verticalSpace,
                StartPagesTitleWidget(
                  title: 'Create new password',
                  titleIcon: Image.asset('assets/images/lock_icon.png'),
                  subTitle:
                      'Save the new password in a safe place, if you forget it then you have to do a forgot password again.',
                  titleCentered: false,
                ),
                30.verticalSpace,
                Text(
                  'Create a new password',
                  style: AppTextStyles.semiBold(
                    fontSize: 15.sp,
                    color: AppColors.mainBlack,
                  ),
                ),
                StartPagesInputWidget(
                  inputController: _passwordInputController,
                  inputType: StartPagesInputType.password,
                  nextFocusNode: _confirmPasswordFocusNode,
                ),
                20.verticalSpace,
                Text(
                  'Confirm a new password',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
