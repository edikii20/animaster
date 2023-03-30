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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.w)),
      child: BlocListener<SignUpPageCubit, SignUpPageState>(
        listenWhen: (previous, current) => current is SignUpPageCompleteState,
        listener: (context, state) {
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
        },
        child: BlocBuilder<SignUpPageCubit, SignUpPageState>(
          buildWhen: (previous, current) => current is SignUpPageCompleteState,
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 40.w,
                vertical: 20.h,
              ),
              height: state is SignUpPageFailureState ? 370.h : 430.h,
              child: Column(
                children: [
                  Container(
                    height: 180.h,
                    width: 180.h,
                    color: state is SignUpPageFailureState
                        ? Colors.red
                        : AppColors.mainDisableDark,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    state is SignUpPageFailureState
                        ? 'Failure!'
                        : 'Verification!',
                    style: AppTextStyles.bold(
                      fontSize: 24.sp,
                      color: AppColors.mainPurple,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    state is SignUpPageFailureState
                        ? state.message
                        : 'Check your email. We have sent you a mail to confirm your registration.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.medium(
                      fontSize: 15.sp,
                      color: AppColors.mainBlack,
                    ),
                  ),
                  state is SignUpPageFailureState
                      ? const SizedBox.shrink()
                      : SizedBox(height: 20.h),
                  state is SignUpPageFailureState
                      ? const SizedBox.shrink()
                      : state is SignUpPageCompleteState
                          ? Container(
                              width: 80.h,
                              height: 80.h,
                              color: Colors.green,
                            )
                          : SizedBox(
                              width: 80.h,
                              height: 80.h,
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
