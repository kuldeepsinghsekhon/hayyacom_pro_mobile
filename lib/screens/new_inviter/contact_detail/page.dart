import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayyacom/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'controller.dart';

class ContactDetailView extends GetView<ContactDetailController> {
  const ContactDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactDetailController>(builder: (_) =>
    Scaffold(
      backgroundColor: AppTheme.themeColors.base,
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
          )
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
                    onTap: () => showToast("To be implemented"),
                    // onTap: () => controller.navigateToContactList(controller.contacts![index]),
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
                        children: controller.contacts![index].phones.map((phone) =>
                          TextWidget.bold(text: phone.number)).toList()
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
