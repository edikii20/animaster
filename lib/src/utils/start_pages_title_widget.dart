import 'package:aniquiz/src/config/colors.dart';
import 'package:aniquiz/src/config/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  Text(
                    _title,
                    style: AppTextStyles.bold(
                      fontSize: 28.sp,
                      color: AppColors.mainBlack,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    width: 32.w,
                    height: 32.w,
                    child: _titleIcon,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                _subTitle!,
                style: AppTextStyles.medium(
                  fontSize: 18.sp,
                  color: AppColors.mainSecondaryLight,
                ),
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
              Text(
                _title,
                style: AppTextStyles.bold(
                  fontSize: 28.sp,
                  color: AppColors.mainBlack,
                ),
              ),
              SizedBox(width: 10.w),
              SizedBox(
                width: 32.w,
                height: 32.w,
                child: _titleIcon,
              ),
            ],
          );
  }
}
