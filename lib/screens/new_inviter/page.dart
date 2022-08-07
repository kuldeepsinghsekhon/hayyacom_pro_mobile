import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayyacom/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'controller.dart';

class NewInviterView extends GetView<NewInviterController> {
  const NewInviterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewInviterController>(builder: (_) =>
    Scaffold(
      backgroundColor: AppTheme.themeColors.base,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(3.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: TextWidget.bold(
                      text: "Welcome",
                      fontSize: 5.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: TextWidget.bold(
                      text: controller.name,
                      fontSize: 10.h,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ),
    ));
  }
}
