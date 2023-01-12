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
        AnimatedContainer(
          width: _selectedIndex == 0 ? 35 : 10,
          height: 10,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: _selectedIndex == 0
                ? AppColors.mainPurple
                : AppColors.mainDisableLight,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        SizedBox(width: 10 * _sizeRatio.width),
        AnimatedContainer(
          width: _selectedIndex == 1 ? 35 : 10,
          height: 10,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: _selectedIndex == 1
                ? AppColors.mainPurple
                : AppColors.mainDisableLight,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        SizedBox(width: 10 * _sizeRatio.width),
        AnimatedContainer(
          width: _selectedIndex == 2 ? 35 : 10,
          height: 10,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: _selectedIndex == 2
                ? AppColors.mainPurple
                : AppColors.mainDisableLight,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ],
    );
  }
}
