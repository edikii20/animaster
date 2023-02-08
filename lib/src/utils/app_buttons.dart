import 'package:aniquiz/src/config/colors.dart';
import 'package:flutter/material.dart';

abstract class AppButtons {
  static Widget fillBorderedButton({
    required Color fillColor,
    required Color borderColor,
    required Widget child,
    required Size sizeRatio,
    required Function? onTap,
    Image? icon,
    double? width,
  }) {
    return Stack(
      children: [
        Container(
          width: width != null ? width * sizeRatio.width : null,
          padding: EdgeInsets.only(
            left: 16 * sizeRatio.width,
            right: 16 * sizeRatio.width,
            top: 18 * sizeRatio.height,
            bottom: 18 * sizeRatio.height - 5,
          ),
          alignment: width != null ? Alignment.center : null,
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(100),
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
                      width: 20,
                      height: 20,
                      child: icon,
                    ),
                    const SizedBox(width: 10),
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

  static Widget goBackButton({required Function onPressed}) {
    return IconButton(
      onPressed: () => onPressed(),
      icon: const Icon(Icons.arrow_back_rounded),
      constraints: BoxConstraints.loose(const Size(28, 28)),
      padding: EdgeInsets.zero,
      iconSize: 28,
      color: AppColors.mainBlack,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
