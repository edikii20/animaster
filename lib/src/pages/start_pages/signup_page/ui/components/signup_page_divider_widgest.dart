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
            margin: EdgeInsets.only(right: 10.w),
            color: AppColors.mainDisableLight.withOpacity(0.3),
          ),
        ),
        Text(
          'or',
          style: AppTextStyles.medium(
            fontSize: 15.sp,
            color: AppColors.mainSecondaryLight,
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            margin: EdgeInsets.only(left: 10.w),
            color: AppColors.mainDisableLight.withOpacity(0.3),
          ),
        ),
      ],
    );
  }
}
