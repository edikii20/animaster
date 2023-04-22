part of '../boarding_page.dart';

class _BoardingPageTipsWidget extends StatelessWidget {
  const _BoardingPageTipsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.sp,
      child: PageView(
        onPageChanged: (value) =>
            context.read<BoardingPageCubit>().onTipsChanged(index: value),
        physics: const BouncingScrollPhysics(),
        children: [
          _BoardingPageTipWidget(
            image: Lottie.asset('assets/animations/boarding_1.json'),
            text:
                'Create, share and play quizzes whenever and wherever you want',
          ),
          _BoardingPageTipWidget(
            image: Lottie.asset('assets/animations/boarding_2.json'),
            text:
                'Create, share and play quizzes whenever and wherever you want',
          ),
          _BoardingPageTipWidget(
            image: Lottie.asset('assets/animations/boarding_3.json'),
            text:
                'Create, share and play quizzes whenever and wherever you want',
          ),
        ],
      ),
    );
  }
}
