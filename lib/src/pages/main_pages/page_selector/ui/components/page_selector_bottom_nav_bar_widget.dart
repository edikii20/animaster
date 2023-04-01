part of '../page_selector_widget.dart';

class _PageSelectorBottomNavBarWidget extends StatelessWidget {
  const _PageSelectorBottomNavBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.w),
          topRight: Radius.circular(20.w),
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.mainSecondaryDark,
            offset: Offset(0, -0.5),
          ),
        ],
        color: Colors.white,
      ),
      child: BlocBuilder<PageSelectorCubit, PageSelectorState>(
        buildWhen: (previous, current) =>
            previous.selectedIndex != current.selectedIndex,
        builder: (context, state) {
          return Theme(
            data: Theme.of(context).copyWith(
              highlightColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
            ),
            child: BottomNavigationBar(
              selectedFontSize: 14.sp,
              unselectedFontSize: 14.sp,
              currentIndex: state.selectedIndex,
              onTap: (index) => context
                  .read<PageSelectorCubit>()
                  .onTapBottomNavBarItem(index: index),
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    state.selectedIndex == 0
                        ? 'assets/icons/home_filled.svg'
                        : 'assets/icons/home.svg',
                    width: 24.w,
                    height: 24.w,
                    colorFilter: ColorFilter.mode(
                      state.selectedIndex == 0
                          ? AppColors.mainBlack
                          : AppColors.mainDisableLight,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    state.selectedIndex == 1
                        ? 'assets/icons/library_filled.svg'
                        : 'assets/icons/library.svg',
                    width: 24.w,
                    height: 24.w,
                    colorFilter: ColorFilter.mode(
                      state.selectedIndex == 1
                          ? AppColors.mainBlack
                          : AppColors.mainDisableLight,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Library',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    state.selectedIndex == 2
                        ? 'assets/icons/puzzle_filled.svg'
                        : 'assets/icons/puzzle.svg',
                    width: 24.w,
                    height: 24.w,
                    colorFilter: ColorFilter.mode(
                      state.selectedIndex == 2
                          ? AppColors.mainBlack
                          : AppColors.mainDisableLight,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Quizzes',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    state.selectedIndex == 3
                        ? 'assets/icons/star_filled.svg'
                        : 'assets/icons/star.svg',
                    width: 24.w,
                    height: 24.w,
                    colorFilter: ColorFilter.mode(
                      state.selectedIndex == 3
                          ? AppColors.mainBlack
                          : AppColors.mainDisableLight,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Rating',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    state.selectedIndex == 4
                        ? 'assets/icons/user_filled.svg'
                        : 'assets/icons/user.svg',
                    width: 24.w,
                    height: 24.w,
                    colorFilter: ColorFilter.mode(
                      state.selectedIndex == 4
                          ? AppColors.mainBlack
                          : AppColors.mainDisableLight,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
