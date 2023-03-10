import 'package:aniquiz/src/config/colors.dart';
import 'package:aniquiz/src/config/sizes.dart';
import 'package:aniquiz/src/config/text_styles.dart';
import 'package:aniquiz/src/pages/start_pages/forgot_password_page/cubit/forgot_password_page_cubit.dart';
import 'package:aniquiz/src/utils/app_buttons.dart';
import 'package:aniquiz/src/utils/start_pages_title_widget.dart';
import 'package:aniquiz/src/utils/start_pages_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'components/forgot_password_page_alert_dialog_widget.dart';

class ForgotPasswordPageWidget extends StatefulWidget {
  const ForgotPasswordPageWidget({super.key});

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
    final sizeRatio = AppSizes.getSizeRatio(context);
    return WillPopScope(
      onWillPop: () async {
        context.goNamed('login');
        return false;
      },
      child: BlocListener<ForgotPasswordPageCubit, ForgotPasswordPageState>(
        listenWhen: (previous, current) =>
            current is ForgotPasswordPageCompleteState ||
            current is ForgotPasswordPageFailureState,
        listener: (context, state) {
          if (state is ForgotPasswordPageCompleteState) {
            context.goNamed(
              'confirm_email_code',
              extra: _emailInputController.text,
            );
          } else {
            showDialog(
              context: context,
              builder: (_) => _ForgotPasswordPageAlertDialogWidget(
                sizeRatio: sizeRatio,
                message: (state as ForgotPasswordPageFailureState).message,
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          floatingActionButton: Container(
            padding: EdgeInsets.symmetric(horizontal: 20 * sizeRatio.width),
            height: 60 * sizeRatio.height,
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
                          width: 21 * sizeRatio.height,
                          height: 21 * sizeRatio.height,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        )
                      : Text(
                          'Continue',
                          style: AppTextStyles.bold(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                  width: double.infinity,
                  sizeRatio: sizeRatio,
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
                left: 20 * sizeRatio.width,
                right: 20 * sizeRatio.width,
                top: 30 * sizeRatio.height,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppButtons.goBackButton(
                      onPressed: () => context.goNamed('login')),
                  SizedBox(height: 40 * sizeRatio.height),
                  StartPagesTitleWidget(
                    sizeRatio: sizeRatio,
                    title: 'Forgot Password',
                    titleIcon: Image.asset('assets/images/key_icon.png'),
                    subTitle:
                        'Enter your email address to get an OTP code to reset your password.',
                    titleCentered: false,
                  ),
                  SizedBox(height: 30 * sizeRatio.height),
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
