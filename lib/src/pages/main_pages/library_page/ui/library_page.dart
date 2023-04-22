import 'package:flutter/material.dart';
import '../../../../config/styles.dart';

class LibraryPageWidget extends StatelessWidget {
  const LibraryPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Library',
        style: AppTextStyles.bold(
          fontSize: 18,
          color: AppColors.mainBlack,
        ),
      ),
    );
  }
}
