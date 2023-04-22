part of '../confirm_email_code_page.dart';

class _ConfirmEmailCodePageResendEmailCodeWidget extends StatelessWidget {
  const _ConfirmEmailCodePageResendEmailCodeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfirmEmailCodePageCubit, ConfirmEmailCodePageState>(
      buildWhen: (previous, current) => previous.seconds != current.seconds,
      builder: (context, state) {
        return state.seconds != 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextWidget(
                    text: 'You can resend code in ',
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: AppColors.mainSecondaryLight,
                  ),
                  AppTextWidget(
                    text: '${state.seconds}',
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: AppColors.mainPurple,
                  ),
                  AppTextWidget(
                    text: ' s',
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: AppColors.mainSecondaryLight,
                  ),
                ],
              )
            : AppButtons.fillBorderedButton(
                fillColor: AppColors.mainPurple,
                borderColor: AppColors.mainPurpleDark,
                child: Text(
                  'Resend code',
                  style: AppTextStyles.bold(
                    fontSize: 16.sp,
                    color: AppColors.white,
                  ),
                ),
                onTap: () {
                  context.read<ConfirmEmailCodePageCubit>().sendEmailCode();
                  context
                      .read<ConfirmEmailCodePageCubit>()
                      .changeResendCodeTimer();
                },
              );
      },
    );
  }
}
