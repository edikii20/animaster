part of '../page_selector_widget.dart';

class _PageSelectorAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const _PageSelectorAppBarWidget({
    Key? key,
    required Size sizeRatio,
  })  : _sizeRatio = sizeRatio,
        super(key: key);

  final Size _sizeRatio;

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
            constraints: BoxConstraints.tight(const Size(28, 28)),
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              width: 28,
              height: 28,
              colorFilter: const ColorFilter.mode(
                AppColors.mainBlack,
                BlendMode.srcIn,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16 * _sizeRatio.width,
              right: 20 * _sizeRatio.width,
            ),
            child: IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              constraints: BoxConstraints.tight(const Size(28, 28)),
              icon: SvgPicture.asset(
                'assets/icons/bell.svg',
                width: 28,
                height: 28,
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
            padding: EdgeInsets.only(right: 20 * _sizeRatio.width),
            child: IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              constraints: BoxConstraints.tight(const Size(28, 28)),
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 28,
                height: 28,
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
            padding: EdgeInsets.only(right: 20 * _sizeRatio.width),
            child: IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              constraints: BoxConstraints.tight(const Size(28, 28)),
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 28,
                height: 28,
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
            padding: EdgeInsets.only(right: 20 * _sizeRatio.width),
            child: IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              constraints: BoxConstraints.tight(const Size(28, 28)),
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 28,
                height: 28,
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
            padding: EdgeInsets.only(right: 20 * _sizeRatio.width),
            child: IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              constraints: BoxConstraints.tight(const Size(28, 28)),
              icon: SvgPicture.asset(
                'assets/icons/settings.svg',
                width: 28,
                height: 28,
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
  Size get preferredSize => Size.fromHeight(86 * _sizeRatio.height);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageSelectorCubit, PageSelectorState>(
      buildWhen: (previous, current) =>
          previous.selectedIndex != current.selectedIndex,
      builder: (context, state) {
        return AppBar(
          title: _pickTitle(index: state.selectedIndex),
          actions: _pickActions(index: state.selectedIndex),
          titleSpacing: 20 * _sizeRatio.width,
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
      },
    );
  }
}
