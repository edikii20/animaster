part of '../tests_collection_details_page.dart';

class _TestsCollectionDetailsPageQuizWidget extends StatelessWidget {
  const _TestsCollectionDetailsPageQuizWidget({
    Key? key,
    required Size sizeRatio,
    required int index,
    required String collectionId,
  })  : _sizeRatio = sizeRatio,
        _index = index,
        _collectionId = collectionId,
        super(key: key);

  final Size _sizeRatio;
  final int _index;
  final String _collectionId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20 * _sizeRatio.height),
      child: Stack(
        children: [
          Row(
            children: [
              _TestsCollectionDetailsPageQuizLeftSectionWidget(
                  sizeRatio: _sizeRatio),
              _TestsCollectionDetailsPageQuizRightSectionWidget(
                  sizeRatio: _sizeRatio),
            ],
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => context.goNamed(
                  'quiz_details',
                  params: {
                    'collectionId': _collectionId,
                    'quizId': '$_index',
                  },
                ),
                splashFactory: NoSplash.splashFactory,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TestsCollectionDetailsPageQuizLeftSectionWidget extends StatelessWidget {
  const _TestsCollectionDetailsPageQuizLeftSectionWidget({
    Key? key,
    required Size sizeRatio,
  })  : _sizeRatio = sizeRatio,
        super(key: key);

  final Size _sizeRatio;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Stack(
        children: [
          Container(
            height: 130 * _sizeRatio.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/quiz_img.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
          ),
          Positioned(
            right: 10 * _sizeRatio.height,
            bottom: 10 * _sizeRatio.height,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10 * _sizeRatio.width,
                vertical: 5 * _sizeRatio.height,
              ),
              decoration: BoxDecoration(
                color: AppColors.mainPurple,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Text(
                '10 Qs',
                style: AppTextStyles.semiBold(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TestsCollectionDetailsPageQuizRightSectionWidget
    extends StatelessWidget {
  const _TestsCollectionDetailsPageQuizRightSectionWidget({
    Key? key,
    required Size sizeRatio,
  })  : _sizeRatio = sizeRatio,
        super(key: key);

  final Size _sizeRatio;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        height: 130 * _sizeRatio.height,
        padding: EdgeInsets.only(
          left: 14 * _sizeRatio.width,
          top: 12 * _sizeRatio.height,
          right: 10 * _sizeRatio.width,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          border: Border.all(
            color: AppColors.mainSecondaryDark,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Re-Train your Brain Attack on Titan',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: AppTextStyles.bold(
                fontSize: 18,
                color: AppColors.mainBlack,
              ),
            ),
            SizedBox(height: 14 * _sizeRatio.height),
            Text(
              '2 weeks ago  •  2.6K plays',
              style: AppTextStyles.semiBold(
                fontSize: 11,
                color: AppColors.mainSecondaryLight,
              ),
            ),
            SizedBox(height: 12 * _sizeRatio.height),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Difficulty: ',
                    style: AppTextStyles.semiBold(
                      fontSize: 14,
                      color: AppColors.mainBlack,
                    ),
                  ),
                  TextSpan(
                    text: 'Hard',
                    style: AppTextStyles.bold(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
