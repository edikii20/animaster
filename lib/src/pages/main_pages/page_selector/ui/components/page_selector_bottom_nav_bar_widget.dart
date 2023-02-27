part of '../page_selector_widget.dart';

class _PageSelectorBottomNavBarWidget extends StatelessWidget {
  const _PageSelectorBottomNavBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
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
              selectedFontSize: 14,
              unselectedFontSize: 14,
              currentIndex: state.selectedIndex,
              onTap: (index) => context
                  .read<PageSelectorCubit>()
                  .onTapBottomNavBarItem(index: index),
              items: [
                BottomNavigationBarItem(
                  icon: Image(
                    color: state.selectedIndex == 0
                        ? AppColors.mainBlack
                        : AppColors.mainDisableLight,
                    image: AssetImage(
                      state.selectedIndex == 0
                          ? 'assets/images/home_filled_icon.png'
                          : 'assets/images/home_icon.png',
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image(
                    color: state.selectedIndex == 1
                        ? AppColors.mainBlack
                        : AppColors.mainDisableLight,
                    image: AssetImage(
                      state.selectedIndex == 1
                          ? 'assets/images/library_filled_icon.png'
                          : 'assets/images/library_icon.png',
                    ),
                  ),
                  label: 'Library',
                ),
                BottomNavigationBarItem(
                  icon: Image(
                    color: state.selectedIndex == 2
                        ? AppColors.mainBlack
                        : AppColors.mainDisableLight,
                    image: AssetImage(
                      state.selectedIndex == 2
                          ? 'assets/images/puzzle_filled_icon.png'
                          : 'assets/images/puzzle_icon.png',
                    ),
                  ),
                  label: 'Tests',
                ),
                BottomNavigationBarItem(
                  icon: Image(
                    color: state.selectedIndex == 3
                        ? AppColors.mainBlack
                        : AppColors.mainDisableLight,
                    image: AssetImage(
                      state.selectedIndex == 3
                          ? 'assets/images/star_filled_icon.png'
                          : 'assets/images/star_icon.png',
                    ),
                  ),
                  label: 'Rating',
                ),
                BottomNavigationBarItem(
                  icon: Image(
                    color: state.selectedIndex == 4
                        ? AppColors.mainBlack
                        : AppColors.mainDisableLight,
                    image: AssetImage(
                      state.selectedIndex == 4
                          ? 'assets/images/user_filled_icon.png'
                          : 'assets/images/user_icon.png',
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
