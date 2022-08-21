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
      backgroundColor: AppTheme.themeColors.inverse,
      appBar: AppBar(
        backgroundColor: AppTheme.themeColors.secondary,
        title: TextWidget.normal(
          text: "Send Invitation",
          color: AppTheme.themeColors.base,
        ),
        actions: [
          Visibility(
            visible: controller.isPermissionDenied,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: IconButtonWidget(
                onTap: () => controller.fetchContacts(),
                backgroundColor: AppTheme.themeColors.transparent,
                icon: Icons.refresh,
                iconColor: AppTheme.themeColors.base,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: IconButtonWidget(
              onTap: () => controller.navigateToInvitationListing(),
              backgroundColor: AppTheme.themeColors.transparent,
              icon: Icons.insert_invitation_outlined,
              iconColor: AppTheme.themeColors.base,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showToast("To be implemented"),
        backgroundColor: AppTheme.themeColors.secondary,
        child: IconButtonWidget(
          backgroundColor: AppTheme.themeColors.transparent,
          icon: Icons.add,
          iconColor: AppTheme.themeColors.base,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.isLoading ? const ShowInPageLoading()
                : controller.isPermissionDenied
                ? const EmptyListWidget(
                    icon: Icons.settings,
                    text: "Please provide permission")
                : controller.contacts?.isEmpty ?? true
                ? const EmptyListWidget(
                    icon: Icons.person,
                    text: "No contact available")
                : Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.contacts?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) => CardWidget(
                    onTap: () => controller.navigateToContactDetail(controller.contacts![index]),
                    backgroundColor: AppTheme.themeColors.base,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 3.h,
                        backgroundColor: AppTheme.themeColors.darkGray,
                        child: TextWidget.bold(
                          text: (index + 1).toString(),
                          color: AppTheme.themeColors.base,
                        ),
                      ),
                      title: TextWidget.bold(text: controller.contacts?[index].displayName ?? ""),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: controller.contacts![index].phones.map((phone) =>
                          TextWidget.normal(
                            text: phone.number,
                            color: AppTheme.themeColors.text,
                            fontSize: 12,
                          )).toList()
                      )
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index)
                  => SizedBox(height: 2.h,),
                ),
              )
            ],
          ),
        )
      ),
    ));
  }
}
