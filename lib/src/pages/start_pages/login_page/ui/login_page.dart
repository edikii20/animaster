import 'package:aniquiz/src/config/colors.dart';
import 'package:aniquiz/src/config/sizes.dart';
import 'package:aniquiz/src/config/text_styles.dart';
import 'package:aniquiz/src/pages/start_pages/login_page/cubit/login_page_cubit.dart';
import 'package:aniquiz/src/utils/app_buttons.dart';
import 'package:aniquiz/src/utils/start_pages_input_widget.dart';
import 'package:aniquiz/src/utils/start_pages_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

part 'components/login_page_login_form_widget.dart';
part 'components/login_page_alert_dialog_widget.dart';

class LogInPageWidget extends StatefulWidget {
  const LogInPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LogInPageWidget> createState() => _LogInPageWidgetState();
}

class _LogInPageWidgetState extends State<LogInPageWidget> {
  final _emailInputController = TextEditingController();
  final _passwordInputController = TextEditingController();
  final _passwordInputFocusNode = FocusNode();

  @override
  void dispose() {
    _emailInputController.dispose();
    _passwordInputController.dispose();
    _passwordInputFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.goNamed('boarding');
        return false;
      },
      child: BlocListener<LogInPageCubit, LogInPageState>(
        listenWhen: (previous, current) => current is LogInPageFailureState,
        listener: (context, state) {
          showDialog(
            context: context,
            builder: (_) => _LogInPageAlertDialogWidget(
              message: (state as LogInPageFailureState).message,
            ),
          );
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          floatingActionButton: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            height: 60.h,
            child: BlocBuilder<LogInPageCubit, LogInPageState>(
              buildWhen: (previous, current) =>
                  (previous is! LogInPageLoadingState &&
                      current is LogInPageLoadingState) ||
                  (previous is LogInPageLoadingState &&
                      current is! LogInPageLoadingState),
              builder: (context, state) {
                return AppButtons.fillBorderedButton(
                  fillColor: AppColors.mainPurple,
                  borderColor: AppColors.mainPurpleDark,
                  child: state is LogInPageLoadingState
                      ? SizedBox(
                          width: 21.h,
                          height: 21.h,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        )
                      : Text(
                          'SIGN IN',
                          style: AppTextStyles.bold(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                  width: double.infinity,
                  onTap: state is LogInPageLoadingState
                      ? null
                      : () => context.read<LogInPageCubit>().onTapSignin(
                            email: _emailInputController.text,
                            password: _passwordInputController.text,
                          ),
                );
              },
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppButtons.goBackButton(
                      onPressed: () => context.goNamed('boarding')),
                  SizedBox(height: 40.h),
                  StartPagesTitleWidget(
                    title: 'Hello there',
                    titleIcon: Image.asset('assets/images/hand_icon.png'),
                    titleCentered: false,
                  ),
                  SizedBox(height: 30.h),
                  _LogInPageRegistrationFormWidget(
                    emailInputController: _emailInputController,
                    passwordInputController: _passwordInputController,
                    passwordInputFocusNode: _passwordInputFocusNode,
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
