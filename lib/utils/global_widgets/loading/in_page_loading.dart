import 'package:flutter/material.dart';

import '../../utils.dart';

class ShowInPageLoading extends StatelessWidget {

  final double? size;
  final bool isExpendedDisabled;

  const ShowInPageLoading({Key? key, this.size, this.isExpendedDisabled = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isExpendedDisabled ? getLoadingWidget()
    : Expanded(
      child: getLoadingWidget(),
    );
  }

  Widget getLoadingWidget() => Center(
    child: Container(
        height: size ?? 50,
        width: size ?? 50,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppTheme.themeColors.secondary,
            borderRadius: BorderRadius.circular(25)),
        child: CircularProgressIndicator(color: AppTheme.themeColors.base,)
    ),
  );

}
