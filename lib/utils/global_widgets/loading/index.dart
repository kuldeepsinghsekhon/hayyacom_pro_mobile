import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayyacom/utils/utils.dart';

void showLoader() {
  Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppTheme.themeColors.dimGray,
              borderRadius: BorderRadius.circular(25)),
            child: const CircularProgressIndicator(),
          ),
        ],
      ),
    ),
    barrierDismissible: false,
  );
}
