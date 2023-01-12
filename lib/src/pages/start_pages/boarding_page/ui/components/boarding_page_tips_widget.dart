part of '../boarding_page.dart';

class _BoardingPageTipsWidget extends StatelessWidget {
  const _BoardingPageTipsWidget({
    Key? key,
    required this.sizeRatio,
  }) : super(key: key);

  final Size sizeRatio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550 * sizeRatio.height,
      child: PageView(
        onPageChanged: (value) =>
            context.read<BoardingCubit>().onTipsChanged(index: value),
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                ),
              ),
              Text(
                'Create, share and play quizzes whenever and wherever you want',
                textAlign: TextAlign.center,
                style: AppTextStyles.bold(
                  fontSize: 28,
                  color: AppColors.mainBlack,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.blue,
                ),
              ),
              Text(
                'Create, share and play quizzes whenever and wherever you want',
                textAlign: TextAlign.center,
                style: AppTextStyles.bold(
                  fontSize: 28,
                  color: AppColors.mainBlack,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.green,
                ),
              ),
              Text(
                'Create, share and play quizzes whenever and wherever you want',
                textAlign: TextAlign.center,
                style: AppTextStyles.bold(
                  fontSize: 28,
                  color: AppColors.mainBlack,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
