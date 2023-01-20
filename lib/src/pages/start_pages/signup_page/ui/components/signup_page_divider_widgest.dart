part of '../signup_page.dart';

class _SignUpPageDividerWidgest extends StatelessWidget {
  const _SignUpPageDividerWidgest({
    Key? key,
    required Size sizeRatio,
  })  : _sizeRatio = sizeRatio,
        super(key: key);

  final Size _sizeRatio;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            margin: EdgeInsets.only(right: 10 * _sizeRatio.width),
            color: AppColors.mainDisableLight.withOpacity(0.3),
          ),
        ),
        Text(
          'or',
          style: AppTextStyles.medium(
            fontSize: 15,
            color: AppColors.mainSecondaryLight,
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            margin: EdgeInsets.only(left: 10 * _sizeRatio.width),
            color: AppColors.mainDisableLight.withOpacity(0.3),
          ),
        ),
      ],
    );
  }
}
