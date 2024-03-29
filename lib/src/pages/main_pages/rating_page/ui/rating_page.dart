import 'package:flutter/material.dart';
import '../../../../config/styles.dart';

class RatingPageWidget extends StatelessWidget {
  const RatingPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Rating',
        style: AppTextStyles.bold(
          fontSize: 18,
          color: AppColors.mainBlack,
        ),
      ),
    );
  }
}
