part of '../signup_page.dart';

class _SignUpPageAlertDialogWidget extends StatefulWidget {
  const _SignUpPageAlertDialogWidget({
    Key? key,
    required Size sizeRatio,
  })  : _sizeRatio = sizeRatio,
        super(key: key);

  final Size _sizeRatio;

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
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.of(context).pop(true);
          });
        },
        child: BlocBuilder<SignUpPageCubit, SignUpPageState>(
          buildWhen: (previous, current) => current is SignUpPageCompleteState,
          builder: (context, state) {
            return state is SignUpPageCompleteState
                ? Container(
                    color: Colors.green,
                  )
                : Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40 * widget._sizeRatio.width,
                      vertical: 20 * widget._sizeRatio.height,
                    ),
                    height: state is SignUpPageFailureState
                        ? 370 * widget._sizeRatio.height
                        : 430 * widget._sizeRatio.height,
                    child: Column(
                      children: [
                        Container(
                          height: 180 * widget._sizeRatio.height,
                          width: 180 * widget._sizeRatio.height,
                          color: state is SignUpPageFailureState
                              ? Colors.red
                              : AppColors.mainDisableDark,
                        ),
                        SizedBox(height: 10 * widget._sizeRatio.height),
                        Text(
                          state is SignUpPageFailureState
                              ? 'Failure!'
                              : 'Verification!',
                          style: AppTextStyles.bold(
                            fontSize: 24,
                            color: AppColors.mainPurple,
                          ),
                        ),
                        SizedBox(height: 5 * widget._sizeRatio.height),
                        Text(
                          state is SignUpPageFailureState
                              ? state.message
                              : 'Check your email. We have sent you a mail to confirm your registration.',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.medium(
                            fontSize: 15,
                            color: AppColors.mainBlack,
                          ),
                        ),
                        state is SignUpPageFailureState
                            ? const SizedBox.shrink()
                            : SizedBox(height: 20 * widget._sizeRatio.height),
                        state is SignUpPageFailureState
                            ? const SizedBox.shrink()
                            : SizedBox(
                                width: 80 * widget._sizeRatio.height,
                                height: 80 * widget._sizeRatio.height,
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
