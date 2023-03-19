import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/colors.dart';
import '../../../../config/sizes.dart';
import '../../../../config/text_styles.dart';

part 'components/test_collection_widget.dart';

class TestsPageWidget extends StatelessWidget {
  const TestsPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeRatio = AppSizes.getSizeRatio(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20 * sizeRatio.width),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10 * sizeRatio.height,
          crossAxisSpacing: 10 * sizeRatio.height,
          childAspectRatio: 11 / 16,
        ),
        padding: EdgeInsets.only(bottom: 20 * sizeRatio.height),
        itemCount: 15,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => _TestCollectionWidget(
          sizeRatio: sizeRatio,
          index: index,
        ),
      ),
    );
  }
}
