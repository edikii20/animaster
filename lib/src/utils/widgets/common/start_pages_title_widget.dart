import 'package:aniquiz/src/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text_widget.dart';

class StartPagesTitleWidget extends StatelessWidget {
  const StartPagesTitleWidget({
    Key? key,
    required String title,
    String? subTitle,
    required Image titleIcon,
    required bool titleCentered,
    bool subTitleCentered = false,
  })  : _title = title,
        _subTitle = subTitle,
        _titleIcon = titleIcon,
        _titleCentered = titleCentered,
        _subTitleCentered = subTitleCentered,
        super(key: key);

  final String _title;
  final String? _subTitle;
  final Image _titleIcon;
  final bool _titleCentered;
  final bool _subTitleCentered;

  @override
  Widget build(BuildContext context) {
    return _subTitle != null
        ? Column(
            children: [
              Row(
                mainAxisAlignment: _titleCentered
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  AppTextWidget(
                    text: _title,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.mainBlack,
                  ),
                  5.horizontalSpace,
                  SizedBox(
                    width: 26.sp,
                    height: 26.sp,
                    child: _titleIcon,
                  ),
                ],
              ),
              10.verticalSpace,
              AppTextWidget(
                text: _subTitle!,
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.mainSecondaryLight,
                textAlign:
                    _subTitleCentered ? TextAlign.center : TextAlign.start,
              ),
            ],
          )
        : Row(
            mainAxisAlignment: _titleCentered
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              AppTextWidget(
                text: _title,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.mainBlack,
              ),
              5.horizontalSpace,
              SizedBox(
                width: 26.sp,
                height: 26.sp,
                child: _titleIcon,
              ),
            ],
          );
  }
}
