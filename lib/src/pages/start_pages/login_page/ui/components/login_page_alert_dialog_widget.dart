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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.w)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40.w,
          vertical: 20.h,
        ),
        height: 370.h,
        child: Column(
          children: [
            Container(
              height: 180.h,
              width: 180.h,
              color: Colors.red,
            ),
            SizedBox(height: 10.h),
            Text(
              'Failure!',
              style: AppTextStyles.bold(
                fontSize: 24.sp,
                color: AppColors.mainPurple,
              ),
            ),
            SizedBox(height: 5.h),
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
