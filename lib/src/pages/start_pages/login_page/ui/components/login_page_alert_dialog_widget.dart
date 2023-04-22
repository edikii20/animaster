part of '../login_page.dart';

class _LogInPageAlertDialogWidget extends StatelessWidget {
  const _LogInPageAlertDialogWidget({
    Key? key,
    required String message,
  })  : _message = message,
        super(key: key);

  final String _message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40.sp,
          vertical: 20.sp,
        ),
        height: 370.sp,
        child: Column(
          children: [
            Container(
              height: 180.sp,
              width: 180.sp,
              color: Colors.red,
            ),
            20.verticalSpace,
            Text(
              'Failure!',
              style: AppTextStyles.bold(
                fontSize: 24.sp,
                color: AppColors.mainPurple,
              ),
            ),
            5.verticalSpace,
            Text(
              _message,
              textAlign: TextAlign.center,
              style: AppTextStyles.medium(
                fontSize: 15.sp,
                color: AppColors.mainBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
