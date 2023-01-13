part of '../boarding_page.dart';

class _BoardingPageTipsWidget extends StatelessWidget {
  const _BoardingPageTipsWidget({
    Key? key,
    required Size sizeRatio,
  })  : _sizeRatio = sizeRatio,
        super(key: key);

  final Size _sizeRatio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550 * _sizeRatio.height,
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

class _BoardingPageTipWidget extends StatelessWidget {
  const _BoardingPageTipWidget({
    Key? key,
    required Widget image,
    required String text,
  })  : _image = image,
        _text = text,
        super(key: key);

  final Widget _image;
  final String _text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _image,
        ),
        Text(
          _text,
          textAlign: TextAlign.center,
          style: AppTextStyles.bold(
            fontSize: 28,
            color: AppColors.mainBlack,
          ),
        ),
      ],
    );
  }
}
