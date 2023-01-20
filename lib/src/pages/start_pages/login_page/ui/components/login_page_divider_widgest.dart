part of '../login_page.dart';

class _LogInPageDividerWidgest extends StatelessWidget {
  const _LogInPageDividerWidgest({
    Key? key,
    required Size sizeRatio,
  })  : _sizeRatio = sizeRatio,
        super(key: key);

  final Size _sizeRatio;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: EdgeInsets.only(right: 10 * _sizeRatio.width),
      color: AppColors.mainDisableLight.withOpacity(0.3),
    );
  }
}
