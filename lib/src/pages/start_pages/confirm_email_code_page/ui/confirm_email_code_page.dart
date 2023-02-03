import 'package:aniquiz/src/config/colors.dart';
import 'package:aniquiz/src/config/sizes.dart';
import 'package:aniquiz/src/config/text_styles.dart';
import 'package:aniquiz/src/pages/start_pages/confirm_email_code_page/cubit/confirm_email_code_page_cubit.dart';
import 'package:aniquiz/src/utils/app_buttons.dart';
import 'package:aniquiz/src/utils/start_pages_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  void initState() {
    super.initState();
    context.read<ConfirmEmailCodePageCubit>().changeResendCodeTimer();
  }

  @override
  Widget build(BuildContext context) {
    final sizeRatio = AppSizes.getSizeRatio(context);
    return BlocListener<ConfirmEmailCodePageCubit, ConfirmEmailCodePageState>(
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
          resizeToAvoidBottomInset: false,
          floatingActionButton: Container(
            padding: EdgeInsets.symmetric(horizontal: 20 * sizeRatio.width),
            height: 60 * sizeRatio.height,
            child: AppButtons.fillBorderedButton(
              fillColor: AppColors.mainPurple,
              borderColor: AppColors.mainPurpleDark,
              child: Text(
                'Confirm',
                style: AppTextStyles.bold(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              width: double.infinity,
              sizeRatio: sizeRatio,
              onTap: () {
                context.goNamed('new_password');
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
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppButtons.goBackButton(
                        onPressed: () => context.goNamed('forgot_password')),
                  ),
                  SizedBox(height: 40 * sizeRatio.height),
                  StartPagesTitleWidget(
                    sizeRatio: sizeRatio,
                    title: 'You\'ve got mail',
                    titleIcon: Image.asset('assets/images/email_icon.png'),
                    subTitle:
                        'We have sent the OTP verification code to your email address. Check your email and enter the code below.',
                    titleCentered: false,
                  ),
                  SizedBox(height: 50 * sizeRatio.height),
                  _ConfirmEmailCodePageEmailCodeInputWidget(
                    emailCodeInputController: _emailCodeInputController,
                    sizeRatio: sizeRatio,
                  ),
                  SizedBox(height: 20 * sizeRatio.height),
                  Text(
                    'Didn\'t receive email?',
                    style: AppTextStyles.medium(
                      fontSize: 18,
                      color: AppColors.mainSecondaryLight,
                    ),
                  ),
                  SizedBox(height: 20 * sizeRatio.height),
                  _ConfirmEmailCodePageResendEmailCodeWidget(
                      sizeRatio: sizeRatio),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
