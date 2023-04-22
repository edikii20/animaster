import 'package:aniquiz/src/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class AppButtons {
  static Widget fillBorderedButton({
    required Color fillColor,
    required Color borderColor,
    required Widget child,
    required Function? onTap,
    Image? icon,
    double? width,
  }) {
    return Stack(
      children: [
        Container(
          width: width?.sp,
          padding: EdgeInsets.only(
            left: 16.sp,
            right: 16.sp,
            top: 17.sp,
            bottom: 17.sp - 5.sp,
          ),
          alignment: width != null ? Alignment.center : null,
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: borderColor,
                offset: Offset(0, 5.sp),
              ),
            ],
          ),
          child: icon != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 20.sp,
                      height: 20.sp,
                      child: icon,
                    ),
                    10.horizontalSpace,
                    child,
                  ],
                )
              : child,
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(100),
            child: InkWell(
              onTap: onTap != null ? () => onTap() : null,
              borderRadius: BorderRadius.circular(100),
              splashColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }

  static Widget iconButton({
    required String icon,
    required double size,
    Color? color,
    VoidCallback? onTap,
  }) {
    return IconButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: BoxConstraints.tight(Size(size, size)),
      icon: SvgPicture.asset(
        icon,
        width: size,
        height: size,
        colorFilter: ColorFilter.mode(
          color ?? AppColors.mainBlack,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  static Widget goBackButton({required Function onPressed}) {
    return IconButton(
      onPressed: () => onPressed(),
      icon: const Icon(Icons.arrow_back_rounded),
      constraints: BoxConstraints.tight(Size(28.sp, 28.sp)),
      padding: EdgeInsets.zero,
      iconSize: 28.sp,
      color: AppColors.mainBlack,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
