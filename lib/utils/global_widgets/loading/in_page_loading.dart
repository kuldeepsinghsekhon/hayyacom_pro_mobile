import 'package:flutter/material.dart';

import '../../utils.dart';

class ShowInPageLoading extends StatelessWidget {
  const ShowInPageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
          color: AppTheme.themeColors.dimGray,
          borderRadius: BorderRadius.circular(25)),
          child: const CircularProgressIndicator()
        ),
      ),
    );
  }
}
