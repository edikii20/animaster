part of '../quiz_details_page.dart';

class _QuizDetailsPageLeaderboardElementWidget extends StatelessWidget {
  const _QuizDetailsPageLeaderboardElementWidget({
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
                radius: 38.sp,
                child: CircleAvatar(
                  radius: 35.sp,
                  backgroundImage: AssetImage(_image),
                ),
              ),
              10.verticalSpace,
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
            top: 73.sp,
            child: CircleAvatar(
              backgroundColor: _pickColor(),
              radius: 10.sp,
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
