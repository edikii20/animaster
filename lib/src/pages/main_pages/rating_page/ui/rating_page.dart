import 'package:flutter/material.dart';

import '../../../../config/colors.dart';
import '../../../../config/text_styles.dart';

class RatingPageWidget extends StatelessWidget {
  const RatingPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Text(
          'Rating',
          style: AppTextStyles.bold(
            fontSize: 18,
            color: AppColors.mainBlack,
          ),
        ),
      ),
    );
  }
}
