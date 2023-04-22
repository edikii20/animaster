import 'package:aniquiz/src/config/styles.dart';
import 'package:aniquiz/src/pages/start_pages/forgot_password_page/cubit/forgot_password_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/app_navigation.dart';
import '../../../../utils/widgets/common/app_buttons.dart';
import '../../../../utils/widgets/common/start_pages_input_widget.dart';
import '../../../../utils/widgets/common/start_pages_title_widget.dart';

part 'components/forgot_password_page_alert_dialog_widget.dart';

class ForgotPasswordPageWidget extends StatefulWidget {
  const ForgotPasswordPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgotPasswordPageWidget> createState() =>
      _ForgotPasswordPageWidgetState();
}

class _ForgotPasswordPageWidgetState extends State<ForgotPasswordPageWidget> {
  final _emailInputController = TextEditingController();

  @override
  void dispose() {
    _emailInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AppNavigation.goToLogin(context: context);
        return false;
      },
      child: BlocListener<ForgotPasswordPageCubit, ForgotPasswordPageState>(
        listenWhen: (previous, current) =>
            current is ForgotPasswordPageCompleteState ||
            current is ForgotPasswordPageFailureState,
        listener: (context, state) {
          if (state is ForgotPasswordPageCompleteState) {
            AppNavigation.goToConfirmEmailCode(
              context: context,
              email: _emailInputController.text,
            );
          } else {
            showDialog(
              context: context,
              builder: (_) => _ForgotPasswordPageAlertDialogWidget(
                message: (state as ForgotPasswordPageFailureState).message,
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.white,
          resizeToAvoidBottomInset: false,
          floatingActionButton: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            height: 49.sp,
            child:
                BlocBuilder<ForgotPasswordPageCubit, ForgotPasswordPageState>(
              buildWhen: (previous, current) =>
                  (previous is! ForgotPasswordPageLoadingState &&
                      current is ForgotPasswordPageLoadingState) ||
                  (previous is ForgotPasswordPageLoadingState &&
                      current is! ForgotPasswordPageLoadingState),
              builder: (context, state) {
                return AppButtons.fillBorderedButton(
                  fillColor: AppColors.mainPurple,
                  borderColor: AppColors.mainPurpleDark,
                  child: state is ForgotPasswordPageLoadingState
                      ? SizedBox(
                          width: 21.sp,
                          height: 21.sp,
                          child: const CircularProgressIndicator(
                            color: AppColors.white,
                            strokeWidth: 3,
                          ),
                        )
                      : Text(
                          'Continue',
                          style: AppTextStyles.bold(
                            fontSize: 16.sp,
                            color: AppColors.white,
                          ),
                        ),
                  width: double.infinity,
                  onTap: state is ForgotPasswordPageLoadingState
                      ? null
                      : () => context
                          .read<ForgotPasswordPageCubit>()
                          .checkUserEmail(email: _emailInputController.text),
                );
              },
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppButtons.goBackButton(
                      onPressed: () =>
                          AppNavigation.goToLogin(context: context)),
                  10.verticalSpace,
                  StartPagesTitleWidget(
                    title: 'Forgot Password',
                    titleIcon: Image.asset('assets/images/key_icon.png'),
                    subTitle:
                        'Enter your email address to get an OTP code to reset your password.',
                    titleCentered: true,
                    subTitleCentered: true,
                  ),
                  40.verticalSpace,
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
