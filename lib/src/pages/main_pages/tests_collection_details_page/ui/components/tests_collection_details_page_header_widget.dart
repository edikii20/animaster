part of '../tests_collection_details_page.dart';

class _TestsCollectionDetailsPageHeaderWidget extends StatelessWidget {
  const _TestsCollectionDetailsPageHeaderWidget({
    Key? key,
    required Size sizeRatio,
  })  : _sizeRatio = sizeRatio,
        super(key: key);

  final Size _sizeRatio;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        left: 20 * _sizeRatio.width,
        right: 20 * _sizeRatio.width,
        bottom: 20 * _sizeRatio.height,
      ),
      sliver: SliverAppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        expandedHeight: 280 * _sizeRatio.height,
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
                  left: 20 * _sizeRatio.width,
                  right: 20 * _sizeRatio.width,
                  bottom: 20 * _sizeRatio.height,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black,
                      Colors.black.withOpacity(0.1),
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
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20 * _sizeRatio.height),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '255 Quizzes',
                            style: AppTextStyles.semiBold(
                              fontSize: 16,
                              color: AppColors.mainSecondaryDark,
                            ),
                          ),
                        ),
                        Text(
                          '155.8K Plays',
                          style: AppTextStyles.semiBold(
                            fontSize: 16,
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
