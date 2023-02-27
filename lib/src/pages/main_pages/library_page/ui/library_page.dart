import 'package:flutter/material.dart';

import '../../../../config/colors.dart';
import '../../../../config/text_styles.dart';

class LibraryPageWidget extends StatelessWidget {
  const LibraryPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Text(
          'Library',
          style: AppTextStyles.bold(
            fontSize: 18,
            color: AppColors.mainBlack,
          ),
        ),
      ),
    );
  }
}
