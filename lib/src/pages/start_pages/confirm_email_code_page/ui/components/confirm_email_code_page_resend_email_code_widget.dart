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
                  Text(
                    'You can resend code in ',
                    style: AppTextStyles.medium(
                      fontSize: 18.sp,
                      color: AppColors.mainSecondaryLight,
                    ),
                  ),
                  Text(
                    '${state.seconds}',
                    style: AppTextStyles.medium(
                      fontSize: 18.sp,
                      color: AppColors.mainPurple,
                    ),
                  ),
                  Text(
                    ' s',
                    style: AppTextStyles.medium(
                      fontSize: 18.sp,
                      color: AppColors.mainSecondaryLight,
                    ),
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
                    color: Colors.white,
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
