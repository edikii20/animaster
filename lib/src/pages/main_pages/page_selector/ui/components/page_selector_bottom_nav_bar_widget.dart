part of '../page_selector_widget.dart';

class _PageSelectorBottomNavBarWidget extends StatelessWidget {
  const _PageSelectorBottomNavBarWidget({
    Key? key,
    required Size sizeRatio,
  })  : _sizeRatio = sizeRatio,
        super(key: key);

  final Size _sizeRatio;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86 * _sizeRatio.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20 * _sizeRatio.width),
          topRight: Radius.circular(20 * _sizeRatio.width),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.mainSecondaryDark,
            offset: Offset(0, -0.5 * _sizeRatio.height),
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
              selectedFontSize: 14,
              unselectedFontSize: 14,
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
                    width: 24,
                    height: 24,
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
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      state.selectedIndex == 2
                          ? AppColors.mainBlack
                          : AppColors.mainDisableLight,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Tests',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    state.selectedIndex == 3
                        ? 'assets/icons/star_filled.svg'
                        : 'assets/icons/star.svg',
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
