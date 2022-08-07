import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils.dart';

class EmptyListWidget extends StatelessWidget {

  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final String? text;
  final double? fontSize;

  const EmptyListWidget({
    Key? key,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.text,
    this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButtonWidget(
              icon: icon,
              iconColor: iconColor ?? AppTheme.themeColors.tertiary,
              iconSize: iconSize ?? 7.h,
            ),
            TextWidget.bold(
              text: text ?? "No data found",
              color: AppTheme.themeColors.tertiary,
              textAlign: TextAlign.center,
              fontSize: fontSize ?? 3.h,
            ),
          ],
        ),
      ),
    );
  }
}
