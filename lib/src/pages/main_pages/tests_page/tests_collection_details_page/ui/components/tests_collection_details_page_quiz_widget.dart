part of '../tests_collection_details_page.dart';

class _TestsCollectionDetailsPageQuizWidget extends StatelessWidget {
  const _TestsCollectionDetailsPageQuizWidget({
    Key? key,
    required int index,
    required String collectionId,
  })  : _index = index,
        _collectionId = collectionId,
        super(key: key);

  final int _index;
  final String _collectionId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Stack(
        children: [
          Row(
            children: const [
              _TestsCollectionDetailsPageQuizLeftSectionWidget(),
              _TestsCollectionDetailsPageQuizRightSectionWidget(),
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
                borderRadius: BorderRadius.circular(20.w),
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Stack(
        children: [
          Container(
            height: 130.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/quiz_img.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.w),
                topLeft: Radius.circular(20.w),
              ),
            ),
          ),
          Positioned(
            right: 10.h,
            bottom: 10.h,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 5.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.mainPurple,
                borderRadius: BorderRadius.circular(7.w),
              ),
              child: Text(
                '10 Qs',
                style: AppTextStyles.semiBold(
                  fontSize: 12.sp,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        height: 130.h,
        padding: EdgeInsets.only(
          left: 14.w,
          right: 10.w,
          top: 12.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20.w),
            topRight: Radius.circular(20.w),
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
                fontSize: 18.sp,
                color: AppColors.mainBlack,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              '2 weeks ago  •  2.6K plays',
              style: AppTextStyles.semiBold(
                fontSize: 11.sp,
                color: AppColors.mainSecondaryLight,
              ),
            ),
            SizedBox(height: 20.h),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Difficulty: ',
                    style: AppTextStyles.semiBold(
                      fontSize: 14.sp,
                      color: AppColors.mainBlack,
                    ),
                  ),
                  TextSpan(
                    text: 'Hard',
                    style: AppTextStyles.bold(
                      fontSize: 14.sp,
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
