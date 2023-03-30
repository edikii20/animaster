part of '../quiz_details_page.dart';

class _QuizDetailsPageQuizInfoWidget extends StatelessWidget {
  const _QuizDetailsPageQuizInfoWidget({
    Key? key,
    required String questionsQuantity,
    required String playedQuantity,
    required String completedQuantity,
    required String difficult,
  })  : _difficult = difficult,
        _completedQuantity = completedQuantity,
        _playedQuantity = playedQuantity,
        _questionsQuantity = questionsQuantity,
        super(key: key);

  final String _questionsQuantity;
  final String _playedQuantity;
  final String _completedQuantity;
  final String _difficult;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _QuizInfoElementWidget(
          title: _questionsQuantity,
          subTitle: 'Questions',
        ),
        Container(
          color: AppColors.mainDisableLight.withOpacity(0.3),
          width: 1,
          height: 70.h,
        ),
        _QuizInfoElementWidget(
          title: _playedQuantity,
          subTitle: 'Played',
        ),
        Container(
          color: AppColors.mainDisableLight.withOpacity(0.3),
          width: 1,
          height: 70.h,
        ),
        _QuizInfoElementWidget(
          title: _completedQuantity,
          subTitle: 'Completed',
        ),
        Container(
          color: AppColors.mainDisableLight.withOpacity(0.3),
          width: 1,
          height: 70.h,
        ),
        _QuizInfoElementWidget(
          title: _difficult,
          subTitle: 'Difficult',
        ),
      ],
    );
  }
}

class _QuizInfoElementWidget extends StatelessWidget {
  const _QuizInfoElementWidget({
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
