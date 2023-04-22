part of '../signup_page.dart';

class _SignUpPageDividerWidgest extends StatelessWidget {
  const _SignUpPageDividerWidgest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            margin: EdgeInsets.only(right: 10.sp),
            color: AppColors.mainDisableLight.withOpacity(0.3),
          ),
        ),
        AppTextWidget(
          text: 'or',
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.mainSecondaryLight,
        ),
        Expanded(
          child: Container(
            height: 1,
            margin: EdgeInsets.only(left: 10.sp),
            color: AppColors.mainDisableLight.withOpacity(0.3),
          ),
        ),
      ],
    );
  }
}
