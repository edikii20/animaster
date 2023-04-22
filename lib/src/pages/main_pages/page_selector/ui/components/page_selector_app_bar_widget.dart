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
    if (index == 0) {
      return [
        AppButtons.iconButton(
          icon: 'assets/icons/search.svg',
          size: 28.sp,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 16.sp,
            right: 16.sp,
          ),
          child: AppButtons.iconButton(
            icon: 'assets/icons/bell.svg',
            size: 28.sp,
          ),
        ),
      ];
    } else if (index == 4) {
      return [
        Padding(
          padding: EdgeInsets.only(right: 16.sp),
          child: AppButtons.iconButton(
            icon: 'assets/icons/settings.svg',
            size: 28.sp,
          ),
        ),
      ];
    } else {
      return [
        Padding(
          padding: EdgeInsets.only(right: 16.sp),
          child: AppButtons.iconButton(
            icon: 'assets/icons/search.svg',
            size: 28.sp,
          ),
        ),
      ];
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(50.sp);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageSelectorCubit, PageSelectorState>(
      buildWhen: (previous, current) =>
          previous.selectedIndex != current.selectedIndex,
      builder: (context, state) {
        return AppBar(
          title: _pickTitle(index: state.selectedIndex),
          actions: _pickActions(index: state.selectedIndex),
          titleSpacing: 16.sp,
          toolbarHeight: 50.sp,
          titleTextStyle: AppTextStyles.bold(
            fontSize: 24.sp,
            color: AppColors.mainBlack,
          ),
          elevation: 0,
          backgroundColor: AppColors.white,
        );
      },
    );
  }
}
