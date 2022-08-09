import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayyacom/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'controller.dart';

class EventListingView extends GetView<EventListingController> {
  const EventListingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventListingController>(builder: (_) =>
    Scaffold(
      backgroundColor: AppTheme.themeColors.base,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(3.w),
          child: Column(
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
                      fontSize: 8.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: TextWidget.normal(
                      text: "Scheduled ${(controller.eventsList?.length ?? 0) > 1
                          ? "Events" : "Event"}",
                      fontSize: 3.h,
                    ),
                  ),
                ],
              ),
              controller.eventsList == null
                ? const ShowInPageLoading()
                : controller.eventsList!.isEmpty
                ? const EmptyListWidget(
                icon: Icons.event,
                text: "No Event is scheduled",
              )
                : Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.eventsList?.length ?? 6,
                  itemBuilder: (BuildContext context, int index) => CardWidget(
                    onTap: () => controller.navigateToContactList(controller.eventsList![index]),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 3.h,
                        backgroundColor: AppTheme.themeColors.darkGray,
                        child: TextWidget.bold(
                          text: (index + 1).toString(),
                          color: AppTheme.themeColors.base,
                        ),
                      ),
                      title: Row(
                        children: [
                          TextWidget.normal(text: "${controller.eventsList?[index].type} - "),
                          TextWidget.bold(
                            text: controller.eventsList?[index].eventDate ?? ""),
                        ],
                      ),
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
