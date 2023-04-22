part of '../boarding_page.dart';

class _BoardingPageTipsIndicatorWidget extends StatelessWidget {
  const _BoardingPageTipsIndicatorWidget({
    Key? key,
    required int selectedIndex,
  })  : _selectedIndex = selectedIndex,
        super(key: key);

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
        10.horizontalSpace,
        _BoardingPageTipsIndicatorItemWidget(
          selectedIndex: _selectedIndex,
          itemIndex: 1,
        ),
        10.horizontalSpace,
        _BoardingPageTipsIndicatorItemWidget(
          selectedIndex: _selectedIndex,
          itemIndex: 2,
        ),
      ],
    );
  }
}
