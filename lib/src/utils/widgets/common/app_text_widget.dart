import 'package:flutter/material.dart';

class AppTextWidget extends StatelessWidget {
  const AppTextWidget({
    Key? key,
    required String text,
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    TextAlign? textAlign,
  })  : _textAlign = textAlign,
        _color = color,
        _fontWeight = fontWeight,
        _fontSize = fontSize,
        _text = text,
        super(key: key);

  final String _text;
  final double _fontSize;
  final FontWeight _fontWeight;
  final Color _color;
  final TextAlign? _textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      textAlign: _textAlign ?? TextAlign.start,
      style: TextStyle(
        fontFamily: 'Nunito',
        fontSize: _fontSize,
        fontWeight: _fontWeight,
        color: _color,
      ),
    );
  }
}
