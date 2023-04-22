part of '../signup_page.dart';

class _SignUpPageAlertDialogWidget extends StatefulWidget {
  const _SignUpPageAlertDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_SignUpPageAlertDialogWidget> createState() =>
      _SignUpPageAlertDialogWidgetState();
}

class _SignUpPageAlertDialogWidgetState
    extends State<_SignUpPageAlertDialogWidget> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    if (context.read<SignUpPageCubit>().state is SignUpPageNotVerifiedState) {
      context.read<SignUpPageCubit>().sendEmailVerificationMail();
      _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        context.read<SignUpPageCubit>().checkEmailVerification();
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: BlocListener<SignUpPageCubit, SignUpPageState>(
        listenWhen: (previous, current) => current is SignUpPageCompleteState,
        listener: (context, state) {
          Future.delayed(const Duration(seconds: 1), () {
            AppNavigation.pop(context: context, result: true);
          });
        },
        child: BlocBuilder<SignUpPageCubit, SignUpPageState>(
          buildWhen: (previous, current) => current is SignUpPageCompleteState,
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 40.sp,
                vertical: 20.sp,
              ),
              height: state is SignUpPageFailureState ? 370.sp : 430.sp,
              child: Column(
                children: [
                  Container(
                    height: 180.sp,
                    width: 180.sp,
                    color: state is SignUpPageFailureState
                        ? Colors.red
                        : AppColors.mainDisableDark,
                  ),
                  10.verticalSpace,
                  AppTextWidget(
                    text: state is SignUpPageFailureState
                        ? 'Failure!'
                        : 'Verification!',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.mainPurple,
                  ),
                  5.verticalSpace,
                  AppTextWidget(
                    text: state is SignUpPageFailureState
                        ? state.message
                        : 'Check your email. We have sent you a mail to confirm your registration.',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mainBlack,
                    textAlign: TextAlign.center,
                  ),
                  state is SignUpPageFailureState
                      ? const SizedBox.shrink()
                      : 20.verticalSpace,
                  state is SignUpPageFailureState
                      ? const SizedBox.shrink()
                      : state is SignUpPageCompleteState
                          ? Container(
                              width: 80.sp,
                              height: 80.sp,
                              color: Colors.green,
                            )
                          : SizedBox(
                              width: 80.sp,
                              height: 80.sp,
                              child: Lottie.asset(
                                  'assets/animations/loader_animation.json'),
                            ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
