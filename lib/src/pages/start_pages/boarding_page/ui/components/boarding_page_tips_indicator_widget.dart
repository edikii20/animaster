part of '../boarding_page.dart';

class _BoardingPageTipsIndicatorWidget extends StatelessWidget {
  const _BoardingPageTipsIndicatorWidget({
    Key? key,
    required Size sizeRatio,
    required int selectedIndex,
  })  : _sizeRatio = sizeRatio,
        _selectedIndex = selectedIndex,
        super(key: key);

  final Size _sizeRatio;
  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _BoardingPageTipsIndicatorItemWidget(
          selectedIndex: _selectedIndex,
          itemIndex: 0,
        ),
        SizedBox(width: 10 * _sizeRatio.width),
        _BoardingPageTipsIndicatorItemWidget(
          selectedIndex: _selectedIndex,
          itemIndex: 1,
        ),
        SizedBox(width: 10 * _sizeRatio.width),
        _BoardingPageTipsIndicatorItemWidget(
          selectedIndex: _selectedIndex,
          itemIndex: 2,
        ),
      ],
    );
  }
}

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
      width: _selectedIndex == _itemIndex ? 35 : 10,
      height: 10,
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
