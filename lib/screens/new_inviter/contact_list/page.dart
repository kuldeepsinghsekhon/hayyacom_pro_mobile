import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayyacom/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'controller.dart';

class ContactListingView extends GetView<ContactListingController> {
  const ContactListingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactListingController>(builder: (_) =>
    Scaffold(
      backgroundColor: AppTheme.themeColors.base,
      appBar: AppBar(
        backgroundColor: AppTheme.themeColors.secondary,
        title: Row(
          children: [
            TextWidget.normal(
              text: "${controller.eventModel?.type} - ",
              color: AppTheme.themeColors.base,
            ),
            TextWidget.bold(
              text: controller.eventModel?.eventDate ?? "",
              color: AppTheme.themeColors.base,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            ],
          ),
        )
      ),
    ));
  }
}
