part of '../quiz_details_page.dart';

class _QuizDetailsPageAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const _QuizDetailsPageAppbarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.sp),
          child: IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            constraints: BoxConstraints.tight(Size(28.sp, 28.sp)),
            icon: SvgPicture.asset(
              'assets/icons/heart.svg',
              width: 28.sp,
              height: 28.sp,
              colorFilter: const ColorFilter.mode(
                AppColors.mainBlack,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
      leading: AppButtons.goBackButton(
        onPressed: () => AppNavigation.pop(context: context),
      ),
      leadingWidth: 69.1.sp,
      titleSpacing: 0,
      toolbarHeight: 70.sp,
      titleTextStyle: AppTextStyles.bold(
        fontSize: 24.sp,
        color: AppColors.mainBlack,
      ),
      elevation: 0,
      backgroundColor: AppColors.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.sp);
}
