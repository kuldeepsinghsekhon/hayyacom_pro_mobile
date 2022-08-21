import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:get/get.dart';
import 'package:hayyacom/models/event_model.dart';
import 'package:hayyacom/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'controller.dart';

class ContactDetailView extends GetView<ContactDetailController> {

  final Contact contact;
  final EventModel event;

  const ContactDetailView({Key? key, required this.contact, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactDetailController>(
      init: ContactDetailController(contact: contact, event: event),
      builder: (ContactDetailController controller) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ///   Back Icon
          Row(
            children: [
              IconButtonWidget(
                onTap: controller.isLoading ? null : () => Get.back(),
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
            visible: controller.contact.phones.isNotEmpty,
            child: Padding(
              padding: EdgeInsets.only(bottom: 1.h),
              child: TextWidget.normal(
                text: controller.contact.phones.first.number,
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
                    ///   Subtract
                    IconButtonWidget(
                      onTap: controller.isLoading ? null
                        : () => controller.updateAdultCount(isIncrement: false),
                      backgroundColor: AppTheme.themeColors.secondary,
                      icon: Icons.remove,
                      iconColor: AppTheme.themeColors.base,
                      iconSize: 20,
                    ),
                    ///   Count
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextWidget.bold(
                        text: controller.adultCount.toString(),
                        fontSize: 2.5.h,
                      ),
                    ),
                    ///   Add
                    IconButtonWidget(
                      onTap: controller.isLoading ? null
                        : () => controller.updateAdultCount(isIncrement: true),
                      backgroundColor: AppTheme.themeColors.secondary,
                      icon: Icons.add,
                      iconColor: AppTheme.themeColors.base,
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
                    ///   Subtract
                    IconButtonWidget(
                      onTap: controller.isLoading ? null
                        : () => controller.updateChildCount(isIncrement: false),
                      backgroundColor: AppTheme.themeColors.secondary,
                      icon: Icons.remove,
                      iconColor: AppTheme.themeColors.base,
                      iconSize: 20,
                    ),
                    ///   Count
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextWidget.bold(
                        text: controller.childCount.toString(),
                        fontSize: 2.5.h,
                      ),
                    ),
                    ///   Add
                    IconButtonWidget(
                      onTap: controller.isLoading ? null
                        : () => controller.updateChildCount(isIncrement: true),
                      backgroundColor: AppTheme.themeColors.secondary,
                      icon: Icons.add,
                      iconColor: AppTheme.themeColors.base,
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
            child: controller.isLoading
              ? ShowInPageLoading(size: 6.5.h, isExpendedDisabled: true,)
              : Button(
                  onTap: () => controller.sendInvitation(),
                  color: AppTheme.themeColors.secondary,
                  buttonSize: 6.5.h,
                  title: "Send Invitations",
                  titleSize: 2.5.h,
                  titleColor: AppTheme.themeColors.base,
                ),
          ),

        ],
      )
    );
  }
}
