import 'package:aniquiz/src/config/colors.dart';
import 'package:aniquiz/src/config/text_styles.dart';
import 'package:aniquiz/src/utils/app_buttons.dart';
import 'package:aniquiz/src/utils/start_pages_input_widget.dart';
import 'package:aniquiz/src/utils/start_pages_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class NewPasswordPageWidget extends StatefulWidget {
  const NewPasswordPageWidget({super.key});

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
        context.goNamed('forgot_password');
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        floatingActionButton: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          height: 60.h,
          child: AppButtons.fillBorderedButton(
            fillColor: AppColors.mainPurple,
            borderColor: AppColors.mainPurpleDark,
            child: Text(
              'Continue',
              style: AppTextStyles.bold(
                fontSize: 16.sp,
                color: Colors.white,
              ),
            ),
            width: double.infinity,
            onTap: () {},
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: 30.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppButtons.goBackButton(
                    onPressed: () => context.goNamed('forgot_password')),
                SizedBox(height: 40.h),
                StartPagesTitleWidget(
                  title: 'Create new password',
                  titleIcon: Image.asset('assets/images/lock_icon.png'),
                  subTitle:
                      'Save the new password in a safe place, if you forget it then you have to do a forgot password again.',
                  titleCentered: false,
                ),
                SizedBox(height: 30.h),
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
                SizedBox(height: 20.h),
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
