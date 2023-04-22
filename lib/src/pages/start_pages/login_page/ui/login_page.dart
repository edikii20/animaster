import 'package:aniquiz/src/app/app_navigation.dart';
import 'package:aniquiz/src/config/styles.dart';
import 'package:aniquiz/src/pages/start_pages/login_page/cubit/login_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../utils/widgets/common/app_buttons.dart';
import '../../../../utils/widgets/common/app_text_widget.dart';
import '../../../../utils/widgets/common/start_pages_input_widget.dart';
import '../../../../utils/widgets/common/start_pages_title_widget.dart';

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
        AppNavigation.goToBoarding(context: context);
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
          backgroundColor: AppColors.white,
          resizeToAvoidBottomInset: false,
          floatingActionButton: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            height: 49.sp,
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
                          width: 21.sp,
                          height: 21.sp,
                          child: const CircularProgressIndicator(
                            color: AppColors.white,
                            strokeWidth: 3,
                          ),
                        )
                      : Text(
                          'SIGN IN',
                          style: AppTextStyles.bold(
                            fontSize: 16.sp,
                            color: AppColors.white,
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
                left: 16.sp,
                right: 16.sp,
                top: 20.sp,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppButtons.goBackButton(
                      onPressed: () =>
                          AppNavigation.goToBoarding(context: context)),
                  10.verticalSpace,
                  StartPagesTitleWidget(
                    title: 'Hello there',
                    titleIcon: Image.asset('assets/images/hand_icon.png'),
                    titleCentered: true,
                  ),
                  40.verticalSpace,
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
