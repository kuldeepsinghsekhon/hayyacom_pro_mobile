import 'package:flutter/material.dart';
import 'package:hayyacom/utils/utils.dart';

class TextWidget extends StatelessWidget {

  final String text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  const TextWidget.normal({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.overflow,
    this.maxLines,
    this.fontSize = 18,
    this.color,
    this.fontWeight}) : super(key: key);

  const TextWidget.bold({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.overflow,
    this.maxLines,
    this.fontSize,
    this.color,
    this.fontWeight = FontWeight.bold}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        color: color ?? AppTheme.themeColors.text,
        fontWeight: fontWeight,
      ),
    );
  }
}
