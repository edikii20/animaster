part of '../quiz_details_page.dart';

class _QuizDetailsPageLeaderboardWidget extends StatelessWidget {
  const _QuizDetailsPageLeaderboardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _QuizLeaderboardElementWidget(
          name: 'Pepranarolan',
          image: 'assets/images/avatar_img.jpg',
          time: '10m 32s',
          quizLeaderboardElementType: QuizLeaderboardElementType.first,
        ),
        _QuizLeaderboardElementWidget(
          name: 'Herinanwauch',
          image: 'assets/images/avatar_img.jpg',
          time: '11m 46s',
          quizLeaderboardElementType: QuizLeaderboardElementType.second,
        ),
        _QuizLeaderboardElementWidget(
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

class _QuizLeaderboardElementWidget extends StatelessWidget {
  const _QuizLeaderboardElementWidget({
    Key? key,
    required String name,
    required String image,
    required String time,
    required QuizLeaderboardElementType quizLeaderboardElementType,
  })  : _quizLeaderboardElementType = quizLeaderboardElementType,
        _time = time,
        _image = image,
        _name = name,
        super(key: key);

  final String _name;
  final String _image;
  final String _time;
  final QuizLeaderboardElementType _quizLeaderboardElementType;

  Color _pickColor() {
    switch (_quizLeaderboardElementType) {
      case QuizLeaderboardElementType.first:
        return AppColors.gold;
      case QuizLeaderboardElementType.second:
        return AppColors.silver;
      case QuizLeaderboardElementType.third:
        return AppColors.bronze;
    }
  }

  String _pickPlace() {
    switch (_quizLeaderboardElementType) {
      case QuizLeaderboardElementType.first:
        return '1';
      case QuizLeaderboardElementType.second:
        return '2';
      case QuizLeaderboardElementType.third:
        return '3';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              CircleAvatar(
                backgroundColor: _pickColor(),
                radius: 38.w,
                child: CircleAvatar(
                  radius: 35.w,
                  backgroundImage: AssetImage(_image),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                _name,
                style: AppTextStyles.bold(
                  fontSize: 15.sp,
                  color: AppColors.mainBlack,
                ),
              ),
              Text(
                _time,
                style: AppTextStyles.bold(
                  fontSize: 15.sp,
                  color: AppColors.mainSecondaryLight,
                ),
              ),
            ],
          ),
          Positioned(
            top: 73.h,
            child: CircleAvatar(
              backgroundColor: _pickColor(),
              radius: 10.w,
              child: Text(
                _pickPlace(),
                style: AppTextStyles.bold(
                  fontSize: 14.sp,
                  color: AppColors.mainBlack,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
