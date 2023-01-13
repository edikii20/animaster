import 'package:aniquiz/src/config/colors.dart';
import 'package:aniquiz/src/config/text_styles.dart';
import 'package:flutter/material.dart';

class StartPagesTitleWidget extends StatelessWidget {
  const StartPagesTitleWidget({
    Key? key,
    required Size sizeRatio,
    required String title,
    String? subTitle,
    required Widget titleIcon,
    required bool titleCentered,
  })  : _sizeRatio = sizeRatio,
        _title = title,
        _subTitle = subTitle,
        _titleIcon = titleIcon,
        _titleCentered = titleCentered,
        super(key: key);

  final Size _sizeRatio;
  final String _title;
  final String? _subTitle;
  final Widget _titleIcon;
  final bool _titleCentered;

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
                  _titleIcon,
                ],
              ),
              SizedBox(height: 20 * _sizeRatio.height),
              Text(
                _subTitle!,
                style: AppTextStyles.medium(
                  fontSize: 18,
                  color: AppColors.mainSecondaryLight,
                ),
                textAlign: TextAlign.center,
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
              _titleIcon,
            ],
          );
  }
}
