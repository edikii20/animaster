part of '../tests_collection_details_page.dart';

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
            height: 130.sp,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/quiz_img.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
          ),
          Positioned(
            right: 10.sp,
            bottom: 10.sp,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.sp,
                vertical: 5.sp,
              ),
              decoration: BoxDecoration(
                color: AppColors.mainPurple,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Text(
                '10 Qs',
                style: AppTextStyles.semiBold(
                  fontSize: 12.sp,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
