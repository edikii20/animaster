import 'package:aniquiz/src/config/colors.dart';
import 'package:aniquiz/src/config/text_styles.dart';
import 'package:flutter/material.dart';

class StartPagesTitleWidget extends StatelessWidget {
  const StartPagesTitleWidget({
    Key? key,
    required Size sizeRatio,
    required String title,
    String? subTitle,
    required Image titleIcon,
    required bool titleCentered,
    bool subTitleCentered = false,
  })  : _sizeRatio = sizeRatio,
        _title = title,
        _subTitle = subTitle,
        _titleIcon = titleIcon,
        _titleCentered = titleCentered,
        _subTitleCentered = subTitleCentered,
        super(key: key);

  final Size _sizeRatio;
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
                      fontSize: 28,
                      color: AppColors.mainBlack,
                    ),
                  ),
                  SizedBox(width: 10 * _sizeRatio.width),
                  SizedBox(
                    width: 32 * _sizeRatio.height,
                    height: 32 * _sizeRatio.height,
                    child: _titleIcon,
                  ),
                ],
              ),
              SizedBox(height: 20 * _sizeRatio.height),
              Text(
                _subTitle!,
                style: AppTextStyles.medium(
                  fontSize: 18,
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
                  fontSize: 28,
                  color: AppColors.mainBlack,
                ),
              ),
              SizedBox(width: 10 * _sizeRatio.width),
              SizedBox(
                width: 32 * _sizeRatio.height,
                height: 32 * _sizeRatio.height,
                child: _titleIcon,
              ),
            ],
          );
  }
}
