import 'package:aniquiz/src/config/colors.dart';
import 'package:aniquiz/src/config/sizes.dart';
import 'package:aniquiz/src/config/text_styles.dart';
import 'package:aniquiz/src/pages/start_pages/new_password_page/cubit/new_password_page_cubit.dart';
import 'package:aniquiz/src/utils/app_buttons.dart';
import 'package:aniquiz/src/utils/start_pages_input_widget.dart';
import 'package:aniquiz/src/utils/start_pages_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'components/new_password_page_rememberme_widget.dart';

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
          onTap: () {},
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
                title: 'Create new password',
                titleIcon: Image.asset('assets/images/lock_icon.png'),
                subTitle:
                    'Save the new password in a safe place, if you forget it then you have to do a forgot password again.',
                titleCentered: false,
              ),
              SizedBox(height: 30 * sizeRatio.height),
              Text(
                'Create a new password',
                style: AppTextStyles.semiBold(
                  fontSize: 15,
                  color: AppColors.mainBlack,
                ),
              ),
              StartPagesInputWidget(
                inputController: _passwordInputController,
                inputType: StartPagesInputType.password,
                nextFocusNode: _confirmPasswordFocusNode,
              ),
              SizedBox(height: 30 * sizeRatio.height),
              Text(
                'Confirm a new password',
                style: AppTextStyles.semiBold(
                  fontSize: 15,
                  color: AppColors.mainBlack,
                ),
              ),
              StartPagesInputWidget(
                inputController: _confirmPasswordInputController,
                passwordInputController: _passwordInputController,
                inputType: StartPagesInputType.confirmPassword,
                currentFocusNode: _confirmPasswordFocusNode,
              ),
              SizedBox(height: 30 * sizeRatio.height),
              _NewPasswordPageRememberMeWidgest(sizeRatio: sizeRatio),
            ],
          ),
        ),
      ),
    );
  }
}
