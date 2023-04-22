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
        _QuizDetailsPageQuizInfoElementWidget(
          title: _questionsQuantity,
          subTitle: 'Questions',
        ),
        Container(
          color: AppColors.mainDisableLight.withOpacity(0.3),
          width: 1,
          height: 70.sp,
        ),
        _QuizDetailsPageQuizInfoElementWidget(
          title: _playedQuantity,
          subTitle: 'Played',
        ),
        Container(
          color: AppColors.mainDisableLight.withOpacity(0.3),
          width: 1,
          height: 70.sp,
        ),
        _QuizDetailsPageQuizInfoElementWidget(
          title: _completedQuantity,
          subTitle: 'Completed',
        ),
        Container(
          color: AppColors.mainDisableLight.withOpacity(0.3),
          width: 1,
          height: 70.sp,
        ),
        _QuizDetailsPageQuizInfoElementWidget(
          title: _difficult,
          subTitle: 'Difficult',
        ),
      ],
    );
  }
}
