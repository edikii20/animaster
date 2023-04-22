import 'package:flutter/material.dart';
import '../../../../config/styles.dart';

class ProfilePageWidget extends StatelessWidget {
  const ProfilePageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile',
        style: AppTextStyles.bold(
          fontSize: 18,
          color: AppColors.mainBlack,
        ),
      ),
    );
  }
}
