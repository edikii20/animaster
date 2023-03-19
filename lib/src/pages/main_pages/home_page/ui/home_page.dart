import 'package:flutter/material.dart';

import '../../../../config/colors.dart';
import '../../../../config/text_styles.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home',
        style: AppTextStyles.bold(
          fontSize: 18,
          color: AppColors.mainBlack,
        ),
      ),
    );
  }
}
