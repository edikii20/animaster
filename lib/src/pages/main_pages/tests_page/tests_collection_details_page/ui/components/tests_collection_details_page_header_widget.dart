part of '../tests_collection_details_page.dart';

class _TestsCollectionDetailsPageHeaderWidget extends StatelessWidget {
  const _TestsCollectionDetailsPageHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        left: 20.sp,
        right: 20.sp,
        bottom: 20.sp,
      ),
      sliver: SliverAppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        expandedHeight: 280.sp,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/attack_on_titan.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20.sp,
                  right: 20.sp,
                  bottom: 20.sp,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Attack on Titan Shingeki no Kyojin 4',
                      style: AppTextStyles.bold(
                        fontSize: 20.sp,
                        color: AppColors.white,
                      ),
                    ),
                    20.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '255 Quizzes',
                            style: AppTextStyles.semiBold(
                              fontSize: 16.sp,
                              color: AppColors.mainSecondaryDark,
                            ),
                          ),
                        ),
                        Text(
                          '155.8K Plays',
                          style: AppTextStyles.semiBold(
                            fontSize: 16.sp,
                            color: AppColors.mainSecondaryDark,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
