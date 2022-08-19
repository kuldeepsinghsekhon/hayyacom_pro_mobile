import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayyacom/utils/constants/assets_images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils.dart';

class GeneralDialog {
  static void show({required Widget child}) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            ///   Body
            Container(
              margin: const EdgeInsets.only(top: 30),
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                  color: AppTheme.themeColors.base.withOpacity(0.55),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      width: 1,
                      color: AppTheme.themeColors.secondary
                  )
              ),
              child: child,
            ),

            Container(
              height: 60, width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                      width: 1,
                      color: AppTheme.themeColors.secondary
                  )
              ),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: const AssetImage(AssetsImages.logo),
                backgroundColor: AppTheme.themeColors.base.withOpacity(0.55),
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: true,
    );
  }
}
