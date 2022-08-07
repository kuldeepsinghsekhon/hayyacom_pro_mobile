import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils.dart';

class Button extends StatelessWidget {

  final Color? color;
  final double? buttonSize;
  final String? title;
  final double? titleSize;
  final Color? titleColor;
  final VoidCallback? onTap;

  const Button({
    Key? key,
    this.color,
    this.buttonSize,
    this.title,
    this.titleSize,
    this.titleColor,
    this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? AppTheme.themeColors.dimGray,
      type: MaterialType.button,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: onTap,
        onLongPress: (){},
        splashColor: AppTheme.themeColors.dimGray,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: buttonSize,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: TextWidget.bold(
            text: title ?? "Submit",
            fontSize: titleSize ?? 2.h,
            textAlign: TextAlign.center,
            color: titleColor ?? AppTheme.themeColors.text,
          ),
        )
      )
    );
  }
}
