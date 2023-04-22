import 'package:aniquiz/src/config/styles.dart';
import 'package:aniquiz/src/pages/start_pages/confirm_email_code_page/cubit/confirm_email_code_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../app/app_navigation.dart';
import '../../../../utils/widgets/common/app_buttons.dart';
import '../../../../utils/widgets/common/app_text_widget.dart';
import '../../../../utils/widgets/common/start_pages_title_widget.dart';

part 'components/confirm_email_code_page_email_code_input_widget.dart';
part 'components/confirm_email_code_page_resend_email_code_widget.dart';

class ConfirmEmailCodePageWidget extends StatefulWidget {
  const ConfirmEmailCodePageWidget({
    Key? key,
  }) : super(key: key);

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
        AppNavigation.goToNewPassword(context: context);
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
            AppNavigation.goToForgotPassword(context: context);
            return false;
          },
          child: Scaffold(
            backgroundColor: AppColors.white,
            resizeToAvoidBottomInset: false,
            floatingActionButton: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              height: 49.sp,
              child: AppButtons.fillBorderedButton(
                fillColor: AppColors.mainPurple,
                borderColor: AppColors.mainPurpleDark,
                child: AppTextWidget(
                  text: 'Confirm',
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: AppColors.white,
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
                  left: 16.sp,
                  right: 16.sp,
                  top: 20.sp,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppButtons.goBackButton(
                          onPressed: () => AppNavigation.goToForgotPassword(
                              context: context)),
                    ),
                    10.verticalSpace,
                    StartPagesTitleWidget(
                      title: 'You\'ve got mail',
                      titleIcon: Image.asset('assets/images/email_icon.png'),
                      subTitle:
                          'We have sent the OTP verification code to your email address. Check your email and enter the code below.',
                      titleCentered: true,
                      subTitleCentered: true,
                    ),
                    50.verticalSpace,
                    _ConfirmEmailCodePageEmailCodeInputWidget(
                      emailCodeInputController: _emailCodeInputController,
                    ),
                    20.verticalSpace,
                    AppTextWidget(
                      text: 'Didn\'t receive email?',
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: AppColors.mainSecondaryLight,
                    ),
                    20.verticalSpace,
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
