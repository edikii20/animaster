import 'package:aniquiz/src/config/colors.dart';
import 'package:aniquiz/src/config/sizes.dart';
import 'package:aniquiz/src/config/text_styles.dart';
import 'package:aniquiz/src/utils/app_buttons.dart';
import 'package:aniquiz/src/utils/start_pages_title_widget.dart';
import 'package:aniquiz/src/utils/start_pages_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(horizontal: 20 * sizeRatio.width),
        height: 60 * sizeRatio.height,
        child: AppButtons.fillBorderedButton(
          fillColor: AppColors.mainPurple,
          borderColor: AppColors.mainPurpleDark,
          text: Text(
            'Continue',
            style: AppTextStyles.bold(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          width: double.infinity,
          sizeRatio: sizeRatio,
          onTap: () => context.push('/confirm_email_code'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
              AppButtons.goBackButton(onPressed: () => context.pop()),
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
    );
  }
}
