part of '../quiz_details_page.dart';

class _QuizDetailsPageLeaderboardWidget extends StatelessWidget {
  const _QuizDetailsPageLeaderboardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _QuizDetailsPageLeaderboardElementWidget(
          name: 'Pepranarolan',
          image: 'assets/images/avatar_img.jpg',
          time: '10m 32s',
          quizLeaderboardElementType: QuizLeaderboardElementType.first,
        ),
        _QuizDetailsPageLeaderboardElementWidget(
          name: 'Herinanwauch',
          image: 'assets/images/avatar_img.jpg',
          time: '11m 46s',
          quizLeaderboardElementType: QuizLeaderboardElementType.second,
        ),
        _QuizDetailsPageLeaderboardElementWidget(
          name: 'edikii',
          image: 'assets/images/avatar_img.jpg',
          time: '13m 50s',
          quizLeaderboardElementType: QuizLeaderboardElementType.third,
        ),
      ],
    );
  }
}

enum QuizLeaderboardElementType { first, second, third }
