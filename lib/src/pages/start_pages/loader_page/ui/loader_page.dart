import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../config/styles.dart';

class LoaderPageWidget extends StatelessWidget {
  const LoaderPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Center(
          child: SizedBox(
            width: 100.sp,
            height: 100.sp,
            child: Lottie.asset('assets/animations/loader_animation.json'),
          ),
        ),
      ),
    );
  }
}
