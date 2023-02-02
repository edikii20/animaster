import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoaderPageWidget extends StatelessWidget {
  const LoaderPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: Lottie.asset('assets/animations/loader_animation.json'),
        ),
      ),
    );
  }
}
