import 'package:aniquiz/src/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          width: width?.w,
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 18.h,
            bottom: 18.h - 5,
          ),
          alignment: width != null ? Alignment.center : null,
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(100.w),
            boxShadow: [
              BoxShadow(
                color: borderColor,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: icon != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 20.w,
                      height: 20.w,
                      child: icon,
                    ),
                    SizedBox(width: 10.w),
                    child,
                  ],
                )
              : child,
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(100.w),
            child: InkWell(
              onTap: onTap != null ? () => onTap() : null,
              borderRadius: BorderRadius.circular(100.w),
              splashColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }

  static Widget goBackButton({required Function onPressed}) {
    return IconButton(
      onPressed: () => onPressed(),
      icon: const Icon(Icons.arrow_back_rounded),
      constraints: BoxConstraints.tight(Size(28.w, 28.w)),
      padding: EdgeInsets.zero,
      iconSize: 28.w,
      color: AppColors.mainBlack,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
