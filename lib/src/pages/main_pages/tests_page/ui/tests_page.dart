import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/app_navigation.dart';
import '../../../../config/styles.dart';

part 'components/test_collection_widget.dart';

class TestsPageWidget extends StatelessWidget {
  const TestsPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5.sp,
          crossAxisSpacing: 5.sp,
          childAspectRatio: 11 / 16,
        ),
        padding: EdgeInsets.only(
          bottom: 20.sp,
          top: 10.sp,
        ),
        itemCount: 15,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => _TestCollectionWidget(
          index: index,
        ),
      ),
    );
  }
}
