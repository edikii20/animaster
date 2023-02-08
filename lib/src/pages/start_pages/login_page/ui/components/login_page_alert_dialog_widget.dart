part of '../login_page.dart';

class _LogInPageAlertDialogWidget extends StatelessWidget {
  const _LogInPageAlertDialogWidget({
    Key? key,
    required Size sizeRatio,
    required String message,
  })  : _sizeRatio = sizeRatio,
        _message = message,
        super(key: key);

  final Size _sizeRatio;
  final String _message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40 * _sizeRatio.width,
          vertical: 20 * _sizeRatio.height,
        ),
        height: 370 * _sizeRatio.height,
        child: Column(
          children: [
            Container(
              height: 180 * _sizeRatio.height,
              width: 180 * _sizeRatio.height,
              color: Colors.red,
            ),
            SizedBox(height: 10 * _sizeRatio.height),
            Text(
              'Failure!',
              style: AppTextStyles.bold(
                fontSize: 24,
                color: AppColors.mainPurple,
              ),
            ),
            SizedBox(height: 5 * _sizeRatio.height),
            Text(
              _message,
              textAlign: TextAlign.center,
              style: AppTextStyles.medium(
                fontSize: 15,
                color: AppColors.mainBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
