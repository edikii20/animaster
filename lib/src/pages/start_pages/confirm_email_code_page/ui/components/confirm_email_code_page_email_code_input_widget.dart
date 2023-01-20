part of '../confirm_email_code_page.dart';

class _ConfirmEmailCodePageEmailCodeInputWidget extends StatelessWidget {
  const _ConfirmEmailCodePageEmailCodeInputWidget({
    Key? key,
    required TextEditingController emailCodeInputController,
    required Size sizeRatio,
  })  : _emailCodeInputController = emailCodeInputController,
        _sizeRatio = sizeRatio,
        super(key: key);

  final TextEditingController _emailCodeInputController;
  final Size _sizeRatio;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      pastedTextStyle: AppTextStyles.bold(
        fontSize: 24,
        color: AppColors.mainBlack,
      ),
      animationType: AnimationType.scale,
      enableActiveFill: true,
      textStyle: AppTextStyles.bold(
        fontSize: 24,
        color: AppColors.mainBlack,
      ),
      keyboardType: TextInputType.number,
      showCursor: false,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        fieldWidth: 80 * _sizeRatio.width,
        fieldHeight: 70 * _sizeRatio.width,
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
