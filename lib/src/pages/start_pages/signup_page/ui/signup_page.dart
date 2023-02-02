import 'dart:async';
import 'package:aniquiz/src/app/bloc/app_bloc.dart';
import 'package:aniquiz/src/config/colors.dart';
import 'package:aniquiz/src/config/sizes.dart';
import 'package:aniquiz/src/config/text_styles.dart';
import 'package:aniquiz/src/domain/db/cloud_firestore_db/cloud_firestore_manager.dart';
import 'package:aniquiz/src/domain/repositories/authentication_repository.dart';
import 'package:aniquiz/src/pages/start_pages/signup_page/cubit/signup_page_cubit.dart';
import 'package:aniquiz/src/utils/app_buttons.dart';
import 'package:aniquiz/src/utils/start_pages_input_widget.dart';
import 'package:aniquiz/src/utils/start_pages_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

part 'components/signup_page_registration_form_widget.dart';
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
    final sizeRatio = AppSizes.getSizeRatio(context);
    return BlocListener<SignUpPageCubit, SignUpPageState>(
      listenWhen: (previous, current) =>
          current is SignUpPageNotVerifiedState ||
          current is SignUpPageFailureState,
      listener: (context, state) {
        showDialog<bool>(
          context: context,
          builder: (_) => BlocProvider.value(
            value: context.read<SignUpPageCubit>(),
            child: _SignUpPageAlertDialogWidget(sizeRatio: sizeRatio),
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
            CloudFirestoreManager.createUser(
              uid: user.uid,
              name: _usernameInputController.text,
              email: _emailInputController.text,
              password: _passwordInputController.text,
            );
          }
        });
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton: Container(
            padding: EdgeInsets.symmetric(horizontal: 20 * sizeRatio.width),
            height: 60 * sizeRatio.height,
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
                          width: 21 * sizeRatio.height,
                          height: 21 * sizeRatio.height,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        )
                      : Text(
                          'Sign up',
                          style: AppTextStyles.bold(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                  width: double.infinity,
                  sizeRatio: sizeRatio,
                  onTap: () => context.read<SignUpPageCubit>().onTapSignup(
                        username: _usernameInputController.text,
                        email: _emailInputController.text,
                        password: _passwordInputController.text,
                        confirmPassword: _confirmPasswordInputController.text,
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
                    title: 'Create an account',
                    subTitle:
                        'Please enter your username, email address and password. If you forget it, then you have to do forgot password.',
                    titleIcon: Image.asset('assets/images/pencil_icon.png'),
                    titleCentered: true,
                    subTitleCentered: true,
                  ),
                  SizedBox(height: 30 * sizeRatio.height),
                  //TODO: Исправить ошибку при которой когда клавиатура открыта и нажимается кнопка назад происходить overflow
                  //TODO: Нужно при нажатии кнопки назад убирать клавиатуру а только потом переходить на другую страницу
                  _SignUpPageRegistrationFormWidget(
                    sizeRatio: sizeRatio,
                    usernameInputController: _usernameInputController,
                    emailInputController: _emailInputController,
                    passwordInputController: _passwordInputController,
                    confirmPasswordInputController:
                        _confirmPasswordInputController,
                    emailInputFocusNode: _emailInputFocusNode,
                    passwordInputFocusNode: _passwordInputFocusNode,
                    confirmPasswordFocusNode: _confirmPasswordFocusNode,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
