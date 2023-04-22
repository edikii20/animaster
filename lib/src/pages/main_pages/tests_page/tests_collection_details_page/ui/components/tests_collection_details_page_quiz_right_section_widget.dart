part of '../tests_collection_details_page.dart';

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
        height: 130.sp,
        padding: EdgeInsets.only(
          left: 14.sp,
          right: 10.sp,
          top: 12.sp,
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
                fontSize: 18.sp,
                color: AppColors.mainBlack,
              ),
            ),
            10.verticalSpace,
            Text(
              '2 weeks ago  •  2.6K plays',
              style: AppTextStyles.semiBold(
                fontSize: 11.sp,
                color: AppColors.mainSecondaryLight,
              ),
            ),
            20.verticalSpace,
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
