import 'package:aniquiz/src/config/colors.dart';
import 'package:aniquiz/src/config/sizes.dart';
import 'package:aniquiz/src/config/text_styles.dart';
import 'package:aniquiz/src/pages/start_pages/login_page/cubit/login_page_cubit.dart';
import 'package:aniquiz/src/utils/app_buttons.dart';
import 'package:aniquiz/src/utils/start_pages_input_widget.dart';
import 'package:aniquiz/src/utils/start_pages_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'components/login_page_login_form_widget.dart';
part 'components/login_page_divider_widgest.dart';

class LogInPageWidget extends StatelessWidget {
  const LogInPageWidget({super.key});

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
          child: Text(
            'SIGN IN',
            style: AppTextStyles.bold(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          width: double.infinity,
          sizeRatio: sizeRatio,
          onTap: () => context.read<LogInPageCubit>().onTapSignin(),
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
              AppButtons.goBackButton(
                  onPressed: () => context.goNamed('boarding')),
              SizedBox(height: 40 * sizeRatio.height),
              StartPagesTitleWidget(
                sizeRatio: sizeRatio,
                title: 'Hello there',
                titleIcon: Image.asset('assets/images/hand_icon.png'),
                titleCentered: false,
              ),
              SizedBox(height: 30 * sizeRatio.height),
              _LogInPageRegistrationFormWidget(sizeRatio: sizeRatio),
            ],
          ),
        ),
      ),
    );
  }
}
