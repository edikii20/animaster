part of '../boarding_page.dart';

class _BoardingPageTipWidget extends StatelessWidget {
  const _BoardingPageTipWidget({
    Key? key,
    required Widget image,
    required String text,
  })  : _image = image,
        _text = text,
        super(key: key);

  final Widget _image;
  final String _text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: _image,
          ),
        ),
        AppTextWidget(
          text: _text,
          textAlign: TextAlign.center,
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.mainBlack,
        ),
      ],
    );
  }
}
