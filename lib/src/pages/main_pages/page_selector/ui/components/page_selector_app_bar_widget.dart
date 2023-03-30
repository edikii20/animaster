part of '../page_selector_widget.dart';

class _PageSelectorAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const _PageSelectorAppBarWidget({
    Key? key,
  }) : super(key: key);

  Text _pickTitle({required int index}) {
    switch (index) {
      case 0:
        return const Text('Home');
      case 1:
        return const Text('Library');
      case 2:
        return const Text('Tests');
      case 3:
        return const Text('Rating');
      case 4:
        return const Text('Profile');
      default:
        return const Text('');
    }
  }

  List<Widget> _pickActions({required int index}) {
    switch (index) {
      case 0:
        return [
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            constraints: BoxConstraints.tight(Size(28.w, 28.w)),
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              width: 28.w,
              height: 28.w,
              colorFilter: const ColorFilter.mode(
                AppColors.mainBlack,
                BlendMode.srcIn,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 20.w,
            ),
            child: IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              constraints: BoxConstraints.tight(Size(28.w, 28.w)),
              icon: SvgPicture.asset(
                'assets/icons/bell.svg',
                width: 28.w,
                height: 28.w,
                colorFilter: const ColorFilter.mode(
                  AppColors.mainBlack,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ];
      case 1:
        return [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              constraints: BoxConstraints.tight(Size(28.w, 28.w)),
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 28.w,
                height: 28.w,
                colorFilter: const ColorFilter.mode(
                  AppColors.mainBlack,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ];
      case 2:
        return [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              constraints: BoxConstraints.tight(Size(28.w, 28.w)),
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 28.w,
                height: 28.w,
                colorFilter: const ColorFilter.mode(
                  AppColors.mainBlack,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ];
      case 3:
        return [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              constraints: BoxConstraints.tight(Size(28.w, 28.w)),
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 28.w,
                height: 28.w,
                colorFilter: const ColorFilter.mode(
                  AppColors.mainBlack,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ];
      case 4:
        return [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              constraints: BoxConstraints.tight(Size(28.w, 28.w)),
              icon: SvgPicture.asset(
                'assets/icons/settings.svg',
                width: 28.w,
                height: 28.w,
                colorFilter: const ColorFilter.mode(
                  AppColors.mainBlack,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ];
      default:
        return [];
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageSelectorCubit, PageSelectorState>(
      buildWhen: (previous, current) =>
          previous.selectedIndex != current.selectedIndex,
      builder: (context, state) {
        return AppBar(
          title: _pickTitle(index: state.selectedIndex),
          actions: _pickActions(index: state.selectedIndex),
          titleSpacing: 20.w,
          toolbarHeight: 70.h,
          titleTextStyle: AppTextStyles.bold(
            fontSize: 24.sp,
            color: AppColors.mainBlack,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        );
      },
    );
  }
}
