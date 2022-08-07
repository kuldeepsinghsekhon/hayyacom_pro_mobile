import 'package:flutter/material.dart';
import 'package:hayyacom/utils/global_widgets/theme/index.dart';

class CardWidget extends StatelessWidget {

  final Color? backgroundColor;
  final VoidCallback? onTap;
  final Widget? child;

  const CardWidget({
    Key? key,
    this.backgroundColor,
    this.onTap,
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? AppTheme.themeColors.inverse,
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
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.transparent,
          child: child,
        ),
      ),
    );
  }
}
