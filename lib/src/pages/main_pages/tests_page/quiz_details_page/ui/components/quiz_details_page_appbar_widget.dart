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
          padding: EdgeInsets.only(right: 20.w),
          child: IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            constraints: BoxConstraints.tight(Size(28.w, 28.w)),
            icon: SvgPicture.asset(
              'assets/icons/heart.svg',
              width: 28.w,
              height: 28.w,
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
      leadingWidth: 69.1.w,
      titleSpacing: 0,
      toolbarHeight: 70.h,
      titleTextStyle: AppTextStyles.bold(
        fontSize: 24.sp,
        color: AppColors.mainBlack,
      ),
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}