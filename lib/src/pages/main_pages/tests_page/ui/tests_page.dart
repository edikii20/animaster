import 'package:flutter/material.dart';

import '../../../../config/colors.dart';
import '../../../../config/text_styles.dart';

class TestsPageWidget extends StatelessWidget {
  const TestsPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Text(
          'Tests',
          style: AppTextStyles.bold(
            fontSize: 18,
            color: AppColors.mainBlack,
          ),
        ),
      ),
    );
  }
}
