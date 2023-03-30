import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoaderPageWidget extends StatelessWidget {
  const LoaderPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SizedBox(
            width: 100.h,
            height: 100.h,
            child: Lottie.asset('assets/animations/loader_animation.json'),
          ),
        ),
      ),
    );
  }
}
