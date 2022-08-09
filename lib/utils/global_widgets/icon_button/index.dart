import 'package:flutter/material.dart';

import '../../utils.dart';

class IconButtonWidget extends StatelessWidget {

  final VoidCallback? onTap;
  final Color? backgroundColor;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;

  const IconButtonWidget({
    Key? key,
    this.onTap,
    this.backgroundColor,
    this.icon,
    this.iconColor,
    this.iconSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? AppTheme.themeColors.base,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Icon(
          icon,
          color: iconColor ?? AppTheme.themeColors.darkGray,
          size:  iconSize ?? 25,
        ),
      ),
    );
  }
}
