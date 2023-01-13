import 'package:aniquiz/src/config/colors.dart';
import 'package:aniquiz/src/config/sizes.dart';
import 'package:aniquiz/src/config/text_styles.dart';
import 'package:aniquiz/src/utils/app_buttons.dart';
import 'package:aniquiz/src/utils/start_pages_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'components/signup_page_registration_form_widget.dart';

class SignUpPageWidget extends StatelessWidget {
  const SignUpPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeRatio = AppSizes.getSizeRatio(context);
    return Scaffold(
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(horizontal: 20 * sizeRatio.width),
        height: 60 * sizeRatio.height,
        child: AppButtons.fillBorderedButton(
          fillColor: AppColors.mainPurple,
          borderColor: AppColors.mainPurpleDark,
          text: Text(
            'Sign up',
            style: AppTextStyles.bold(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          width: double.infinity,
          sizeRatio: sizeRatio,
          onTap: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20 * sizeRatio.width,
            right: 20 * sizeRatio.width,
            top: 10 * sizeRatio.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppButtons.goBackButton(onPressed: () => context.go('/boarding')),
              SizedBox(height: 20 * sizeRatio.height),
              StartPagesTitleWidget(
                sizeRatio: sizeRatio,
                title: 'Create an account',
                subTitle:
                    'Please enter your username, email address and password. If you forget it, then you have to do forgot password.',
                titleIcon: Container(
                  width: 28,
                  height: 28,
                  color: Colors.blue,
                ),
                titleCentered: true,
              ),
              SizedBox(height: 25 * sizeRatio.height),
              _SignUpPageRegistrationFormWidget(sizeRatio: sizeRatio),
            ],
          ),
        ),
      ),
    );
  }
}
