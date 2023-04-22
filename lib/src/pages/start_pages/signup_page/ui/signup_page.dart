import 'dart:async';
import 'package:aniquiz/src/app/bloc/app_bloc.dart';
import 'package:aniquiz/src/config/styles.dart';
import 'package:aniquiz/src/domain/repositories/authentication_repository.dart';
import 'package:aniquiz/src/pages/start_pages/signup_page/cubit/signup_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../app/app_navigation.dart';
import '../../../../utils/widgets/common/app_buttons.dart';
import '../../../../utils/widgets/common/app_text_widget.dart';
import '../../../../utils/widgets/common/start_pages_input_widget.dart';
import '../../../../utils/widgets/common/start_pages_title_widget.dart';

part 'components/signup_page_divider_widgest.dart';
part 'components/signup_page_alert_dialog_widget.dart';

class SignUpPageWidget extends StatefulWidget {
  const SignUpPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpPageWidget> createState() => _SignUpPageWidgetState();
}

class _SignUpPageWidgetState extends State<SignUpPageWidget> {
  final _usernameInputController = TextEditingController();
  final _emailInputController = TextEditingController();
  final _passwordInputController = TextEditingController();
  final _confirmPasswordInputController = TextEditingController();
  final _emailInputFocusNode = FocusNode();
  final _passwordInputFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _usernameInputController.dispose();
    _emailInputController.dispose();
    _passwordInputController.dispose();
    _emailInputFocusNode.dispose();
    _passwordInputFocusNode.dispose();
    _confirmPasswordInputController.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpPageCubit, SignUpPageState>(
      listenWhen: (previous, current) =>
          current is SignUpPageNotVerifiedState ||
          current is SignUpPageFailureState,
      listener: (context, state) {
        showDialog<bool>(
          context: context,
          builder: (_) => BlocProvider.value(
            value: context.read<SignUpPageCubit>(),
            child: const _SignUpPageAlertDialogWidget(),
          ),
        ).then((value) {
          if (value != true) {
            if (state is SignUpPageNotVerifiedState) {
              context.read<SignUpPageCubit>().onAlertDialogNotVerifiedDismissed(
                    email: _emailInputController.text,
                    password: _passwordInputController.text,
                  );
            }
          } else {
            final user =
                context.read<AuthenticationRepository>().currentFirebaseUser!;
            context.read<AppBloc>().add(AppUserChangedEvent(
                  user: user,
                ));
            context.read<SignUpPageCubit>().onCompleteSignup(
                  uid: user.uid,
                  name: _usernameInputController.text,
                  email: _emailInputController.text,
                  password: _passwordInputController.text,
                );
          }
        });
      },
      child: WillPopScope(
        onWillPop: () async {
          AppNavigation.goToBoarding(context: context);
          return false;
        },
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: AppColors.white,
            resizeToAvoidBottomInset: false,
            floatingActionButton: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              height: 49.sp,
              child: BlocBuilder<SignUpPageCubit, SignUpPageState>(
                buildWhen: (previous, current) =>
                    (previous is! SignUpPageLoadingState &&
                        current is SignUpPageLoadingState) ||
                    (previous is SignUpPageLoadingState &&
                        current is! SignUpPageLoadingState),
                builder: (context, state) {
                  return AppButtons.fillBorderedButton(
                    fillColor: AppColors.mainPurple,
                    borderColor: AppColors.mainPurpleDark,
                    child: state is SignUpPageLoadingState
                        ? SizedBox(
                            width: 21.sp,
                            height: 21.sp,
                            child: const CircularProgressIndicator(
                              color: AppColors.white,
                              strokeWidth: 3,
                            ),
                          )
                        : AppTextWidget(
                            text: 'Sign up',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                    width: double.infinity,
                    onTap: state is SignUpPageLoadingState
                        ? null
                        : () => context.read<SignUpPageCubit>().onTapSignup(
                              username: _usernameInputController.text,
                              email: _emailInputController.text,
                              password: _passwordInputController.text,
                              confirmPassword:
                                  _confirmPasswordInputController.text,
                            ),
                  );
                },
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  left: 16.sp,
                  right: 16.sp,
                  top: 20.sp,
                  bottom: 90.sp,
                ),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppButtons.goBackButton(
                        onPressed: () =>
                            AppNavigation.goToBoarding(context: context)),
                    10.verticalSpace,
                    StartPagesTitleWidget(
                      title: 'Create an account',
                      subTitle:
                          'Please enter your username, email address and password. If you forget it, then you have to do forgot password.',
                      titleIcon: Image.asset('assets/images/pencil_icon.png'),
                      titleCentered: true,
                      subTitleCentered: true,
                    ),
                    20.verticalSpace,
                    //TODO: Исправить ошибку при которой когда клавиатура открыта и нажимается кнопка назад происходить overflow
                    //TODO: Нужно при нажатии кнопки назад убирать клавиатуру а только потом переходить на другую страницу
                    Text(
                      'Username',
                      style: AppTextStyles.semiBold(
                        fontSize: 16.sp,
                        color: AppColors.mainBlack,
                      ),
                    ),
                    StartPagesInputWidget(
                      inputController: _usernameInputController,
                      inputType: StartPagesInputType.username,
                      nextFocusNode: _emailInputFocusNode,
                    ),
                    20.verticalSpace,
                    Text(
                      'Email',
                      style: AppTextStyles.semiBold(
                        fontSize: 16.sp,
                        color: AppColors.mainBlack,
                      ),
                    ),
                    StartPagesInputWidget(
                      inputController: _emailInputController,
                      inputType: StartPagesInputType.email,
                      currentFocusNode: _emailInputFocusNode,
                      nextFocusNode: _passwordInputFocusNode,
                    ),
                    20.verticalSpace,
                    Text(
                      'Password',
                      style: AppTextStyles.semiBold(
                        fontSize: 16.sp,
                        color: AppColors.mainBlack,
                      ),
                    ),
                    StartPagesInputWidget(
                      inputController: _passwordInputController,
                      inputType: StartPagesInputType.password,
                      currentFocusNode: _passwordInputFocusNode,
                      nextFocusNode: _confirmPasswordFocusNode,
                    ),
                    20.verticalSpace,
                    Text(
                      'Confirm Password',
                      style: AppTextStyles.semiBold(
                        fontSize: 16.sp,
                        color: AppColors.mainBlack,
                      ),
                    ),
                    StartPagesInputWidget(
                      inputController: _confirmPasswordInputController,
                      passwordInputController: _passwordInputController,
                      inputType: StartPagesInputType.confirmPassword,
                      currentFocusNode: _confirmPasswordFocusNode,
                    ),
                    40.verticalSpace,
                    const _SignUpPageDividerWidgest(),
                    30.verticalSpace,
                    AppButtons.fillBorderedButton(
                      fillColor: AppColors.mainButtonWhiteLight,
                      borderColor: AppColors.mainDisableDark,
                      child: Text(
                        'Continue with Google',
                        style: AppTextStyles.semiBold(
                          fontSize: 16.sp,
                          color: AppColors.mainBlack,
                        ),
                      ),
                      width: double.infinity,
                      icon: Image.asset('assets/images/google_icon.png'),
                      onTap: () {},
                    ),
                    30.verticalSpace,

                    AppButtons.fillBorderedButton(
                      fillColor: AppColors.mainButtonWhiteLight,
                      borderColor: AppColors.mainDisableDark,
                      child: AppTextWidget(
                        text: 'Continue with Apple',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainBlack,
                      ),
                      width: double.infinity,
                      icon: Image.asset('assets/images/apple_icon.png'),
                      onTap: () {},
                    ),
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
