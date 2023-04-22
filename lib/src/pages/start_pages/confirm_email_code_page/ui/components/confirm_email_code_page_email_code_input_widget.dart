part of '../confirm_email_code_page.dart';

class _ConfirmEmailCodePageEmailCodeInputWidget extends StatelessWidget {
  const _ConfirmEmailCodePageEmailCodeInputWidget({
    Key? key,
    required TextEditingController emailCodeInputController,
  })  : _emailCodeInputController = emailCodeInputController,
        super(key: key);

  final TextEditingController _emailCodeInputController;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      pastedTextStyle: AppTextStyles.bold(
        fontSize: 24.sp,
        color: AppColors.mainBlack,
      ),
      animationType: AnimationType.scale,
      enableActiveFill: true,
      textStyle: AppTextStyles.bold(
        fontSize: 24.sp,
        color: AppColors.mainBlack,
      ),
      keyboardType: TextInputType.number,
      showCursor: false,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        fieldWidth: 80.sp,
        fieldHeight: 70.sp,
        activeFillColor: AppColors.mainButtonWhiteLight,
        selectedFillColor: AppColors.mainButtonWhiteLight,
        inactiveFillColor: AppColors.mainButtonWhiteLight,
        inactiveColor: AppColors.mainSecondaryDark,
        selectedColor: AppColors.mainPurple,
        activeColor: AppColors.mainSecondaryDark,
        borderWidth: 1,
        borderRadius: BorderRadius.circular(20),
      ),
      controller: _emailCodeInputController,
      dialogConfig: DialogConfig(
        affirmativeText: null,
        dialogContent: null,
        dialogTitle: null,
        negativeText: null,
        platform: null,
      ),
      onChanged: (String value) {},
    );
  }
}
