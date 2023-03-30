import 'package:aniquiz/src/config/colors.dart';
import 'package:aniquiz/src/config/text_styles.dart';
import 'package:aniquiz/src/pages/start_pages/confirm_email_code_page/cubit/confirm_email_code_page_cubit.dart';
import 'package:aniquiz/src/utils/app_buttons.dart';
import 'package:aniquiz/src/utils/start_pages_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

part 'components/confirm_email_code_page_email_code_input_widget.dart';
part 'components/confirm_email_code_page_resend_email_code_widget.dart';

class ConfirmEmailCodePageWidget extends StatefulWidget {
  const ConfirmEmailCodePageWidget({super.key});

  @override
  State<ConfirmEmailCodePageWidget> createState() =>
      _ConfirmEmailCodePageWidgetState();
}

class _ConfirmEmailCodePageWidgetState
    extends State<ConfirmEmailCodePageWidget> {
  final _emailCodeInputController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   context.read<ConfirmEmailCodePageCubit>().changeResendCodeTimer();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConfirmEmailCodePageCubit, ConfirmEmailCodePageState>(
      listenWhen: (previous, current) =>
          current.status == ConfirmEmailCodePageStatus.complete,
      listener: (context, state) {
        context.goNamed('new_password');
      },
      child: BlocListener<ConfirmEmailCodePageCubit, ConfirmEmailCodePageState>(
        listenWhen: (previous, current) => previous.seconds != current.seconds,
        listener: (context, state) {
          if (state.seconds > 0) {
            context.read<ConfirmEmailCodePageCubit>().changeResendCodeTimer();
          }
        },
        child: WillPopScope(
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
                  'Confirm',
                  style: AppTextStyles.bold(
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
                width: double.infinity,
                onTap: () => context
                    .read<ConfirmEmailCodePageCubit>()
                    .onTapConfirm(userOtp: _emailCodeInputController.text),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  top: 30.h,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppButtons.goBackButton(
                          onPressed: () => context.goNamed('forgot_password')),
                    ),
                    SizedBox(height: 40.h),
                    StartPagesTitleWidget(
                      title: 'You\'ve got mail',
                      titleIcon: Image.asset('assets/images/email_icon.png'),
                      subTitle:
                          'We have sent the OTP verification code to your email address. Check your email and enter the code below.',
                      titleCentered: false,
                    ),
                    SizedBox(height: 50.h),
                    _ConfirmEmailCodePageEmailCodeInputWidget(
                      emailCodeInputController: _emailCodeInputController,
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Didn\'t receive email?',
                      style: AppTextStyles.medium(
                        fontSize: 18.sp,
                        color: AppColors.mainSecondaryLight,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    const _ConfirmEmailCodePageResendEmailCodeWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
