import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:get/get.dart';
import 'package:hayyacom/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'controller.dart';

class ContactDetailView extends GetView<ContactDetailController> {

  final Contact contact;

  const ContactDetailView({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactDetailController>(
      init: ContactDetailController(contact: contact),
      builder: (ContactDetailController controller) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              IconButtonWidget(
                onTap: () => Get.back(),
                backgroundColor: AppTheme.themeColors.transparent,
                icon: Icons.arrow_back,
                iconSize: 24,
                iconColor: AppTheme.themeColors.secondary,
              ),
            ],
          ),
          ///   Name
          Padding(
            padding: EdgeInsets.only(bottom: 0.5.h),
            child: TextWidget.bold(
              text: controller.contact.displayName,
              fontSize: 2.5.h,
            ),
          ),
          ///   Phone Number
          Visibility(
            visible: true,
            // visible: controller.contact.phones.isNotEmpty,
            child: Padding(
              padding: EdgeInsets.only(bottom: 1.h),
              child: TextWidget.normal(
                text: "7508884086",
                fontSize: 2.h,
                color: AppTheme.themeColors.text,
              ),
            ),
          ),
          Divider(color: AppTheme.themeColors.secondary, height: 1,),
          ///   Adult's
          Padding(
            padding: EdgeInsets.only(top: 0.8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget.bold(
                  text: controller.adultCount > 1 ? "Adult's" : "Adult",
                  fontSize: 2.5.h,
                ),
                Row(
                  children: [
                    IconButtonWidget(
                      onTap: () => controller.updateAdultCount(isIncrement: false),
                      backgroundColor: AppTheme.themeColors.darkGray,
                      icon: Icons.remove,
                      iconColor: AppTheme.themeColors.secondary,
                      iconSize: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextWidget.bold(
                        text: controller.adultCount.toString(),
                        fontSize: 2.5.h,
                      ),
                    ),
                    IconButtonWidget(
                      onTap: () => controller.updateAdultCount(isIncrement: true),
                      backgroundColor: AppTheme.themeColors.darkGray,
                      icon: Icons.add,
                      iconColor: AppTheme.themeColors.secondary,
                      iconSize: 20,
                    )
                  ],
                )
              ],
            ),
          ),
          ///   Children's
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0.8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget.bold(
                  text: controller.childCount > 1 ? "Children's " : "Children",
                  fontSize: 2.5.h,
                ),
                Row(
                  children: [
                    IconButtonWidget(
                      onTap: () => controller.updateChildCount(isIncrement: false),
                      backgroundColor: AppTheme.themeColors.darkGray,
                      icon: Icons.remove,
                      iconColor: AppTheme.themeColors.secondary,
                      iconSize: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextWidget.bold(
                        text: controller.childCount.toString(),
                        fontSize: 2.5.h,
                      ),
                    ),
                    IconButtonWidget(
                      onTap: () => controller.updateChildCount(isIncrement: true),
                      backgroundColor: AppTheme.themeColors.darkGray,
                      icon: Icons.add,
                      iconColor: AppTheme.themeColors.secondary,
                      iconSize: 20,
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(color: AppTheme.themeColors.secondary, height: 1,),
          ///   Total Guests
          Padding(
            padding: EdgeInsets.only(top: 0.8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget.bold(
                  text: controller.totalGuestCount > 1 ? "Total Guest's" : "Total Guest",
                  fontSize: 2.5.h,
                ),
                Row(
                  children: [
                    const SizedBox(width: 25,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextWidget.bold(
                        text: controller.totalGuestCount.toString(),
                        fontSize: 2.5.h,
                      ),
                    ),
                    const SizedBox(width: 25,),
                  ],
                )
              ],
            ),
          ),
          ///   Invite button
          Padding(
            padding: EdgeInsets.only(top: 3.h),
            child: Button(
              // onTap: () => controller.validate(),
              color: AppTheme.themeColors.inverse,
              buttonSize: 6.5.h,
              title: "Send Invitations",
              titleSize: 2.5.h,
              titleColor: AppTheme.themeColors.text,
            ),
          ),

        ],
      )
    );
  }
}
