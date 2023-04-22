part of '../boarding_page.dart';

class _BoardingPageTipsIndicatorItemWidget extends StatelessWidget {
  const _BoardingPageTipsIndicatorItemWidget({
    Key? key,
    required int selectedIndex,
    required int itemIndex,
  })  : _selectedIndex = selectedIndex,
        _itemIndex = itemIndex,
        super(key: key);

  final int _selectedIndex;
  final int _itemIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: _selectedIndex == _itemIndex ? 30.sp : 10.sp,
      height: 10.sp,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: _selectedIndex == _itemIndex
            ? AppColors.mainPurple
            : AppColors.mainDisableLight,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
