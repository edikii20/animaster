part of '../quiz_details_page.dart';

class _QuizDetailsPageQuizInfoElementWidget extends StatelessWidget {
  const _QuizDetailsPageQuizInfoElementWidget({
    Key? key,
    required String title,
    required String subTitle,
  })  : _subTitle = subTitle,
        _title = title,
        super(key: key);

  final String _title;
  final String _subTitle;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: '$_title\n',
            style: AppTextStyles.bold(
              fontSize: 18.sp,
              color: AppColors.mainBlack,
            ),
          ),
          TextSpan(
            text: _subTitle,
            style: AppTextStyles.semiBold(
              fontSize: 16.sp,
              color: AppColors.mainSecondaryLight,
            ),
          ),
        ],
      ),
    );
  }
}
