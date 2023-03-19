part of '../tests_collection_details_page.dart';

class _TestsCollectionDetailsPageAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const _TestsCollectionDetailsPageAppbarWidget({
    Key? key,
    required Size sizeRatio,
  })  : _sizeRatio = sizeRatio,
        super(key: key);

  final Size _sizeRatio;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Quizzes',
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20 * _sizeRatio.width),
          child: IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            constraints: BoxConstraints.tight(const Size(28, 28)),
            icon: SvgPicture.asset(
              'assets/icons/filter.svg',
              width: 28,
              height: 28,
              colorFilter: const ColorFilter.mode(
                AppColors.mainBlack,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
      leading: AppButtons.goBackButton(
        onPressed: () => context.pop(),
      ),
      leadingWidth: 69.1 * _sizeRatio.width,
      titleSpacing: 0,
      actionsIconTheme: const IconThemeData(
        size: 28,
        color: AppColors.mainBlack,
      ),
      toolbarHeight: 86 * _sizeRatio.height,
      titleTextStyle: AppTextStyles.bold(
        fontSize: 24,
        color: AppColors.mainBlack,
      ),
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(86 * _sizeRatio.height);
}
