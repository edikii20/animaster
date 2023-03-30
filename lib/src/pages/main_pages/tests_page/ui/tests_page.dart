import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/colors.dart';
import '../../../../config/text_styles.dart';

part 'components/test_collection_widget.dart';

class TestsPageWidget extends StatelessWidget {
  const TestsPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.h,
          childAspectRatio: 11 / 16,
        ),
        padding: EdgeInsets.only(bottom: 20.h),
        itemCount: 15,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => _TestCollectionWidget(
          index: index,
        ),
      ),
    );
  }
}
