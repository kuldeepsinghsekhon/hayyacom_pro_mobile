import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayyacom/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'controller.dart';

class InvitationListingView extends GetView<InvitationListingController> {
  const InvitationListingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvitationListingController>(builder: (_) =>
    Scaffold(
      backgroundColor: AppTheme.themeColors.inverse,
      appBar: AppBar(
        backgroundColor: AppTheme.themeColors.secondary,
        title: TextWidget.normal(
          text: "Invitations",
          color: AppTheme.themeColors.base,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.invitationList == null
                ? const ShowInPageLoading()
                :  controller.invitationList?.isEmpty ?? true
                ? const EmptyListWidget(
                    icon: Icons.insert_invitation_outlined,
                    text: "You haven't sent any invitation yet")
                : Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.invitationList?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) => CardWidget(
                    onTap: () => controller.navigateToContactDetail(),
                    backgroundColor: AppTheme.themeColors.base,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget.bold(text: controller.invitationList?[index].contact?.guestName ?? ""),
                                    TextWidget.normal(
                                      text: controller.invitationList?[index].contact?.guestMobile != null
                                          ? "+" + controller.invitationList![index].contact!.guestMobile! : "",
                                      color: AppTheme.themeColors.text,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const TextWidget.bold(text: "Status"),
                                    TextWidget.normal(
                                      text: controller.invitationList?[index].status ?? "Not Accepted",
                                      color: AppTheme.themeColors.text,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            Divider(
                              color: AppTheme.themeColors.secondary,
                              thickness: 1,
                            ),
                            ///   Guests Invited
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 49,
                                  child: Column(
                                    children: [
                                      TextWidget.bold(
                                        text: "Guests Invited",
                                        color: AppTheme.themeColors.text,
                                        fontSize: 12,
                                      ),
                                      Divider(
                                        color: AppTheme.themeColors.secondary,
                                        thickness: 1,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 5),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                TextWidget.normal(
                                                  text: "Adult's",
                                                  color: AppTheme.themeColors.text,
                                                  fontSize: 12,
                                                ),
                                                TextWidget.normal(
                                                  text: controller.invitationList?[index].totalGuest ?? "0",
                                                  color: AppTheme.themeColors.text,
                                                  fontSize: 12,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                TextWidget.normal(
                                                  text: "Children's",
                                                  color: AppTheme.themeColors.text,
                                                  fontSize: 12,
                                                ),
                                                TextWidget.normal(
                                                  text: controller.invitationList?[index].totalChildren ?? "0",
                                                  color: AppTheme.themeColors.text,
                                                  fontSize: 12,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                TextWidget.bold(
                                                  text: "Total Guest's",
                                                  color: AppTheme.themeColors.text,
                                                  fontSize: 12,
                                                ),
                                                TextWidget.bold(
                                                  text: (int.parse(controller.invitationList?[index].totalGuest ?? "0")
                                                      + int.parse(controller.invitationList?[index].totalChildren ?? "0")).toString(),
                                                  color: AppTheme.themeColors.text,
                                                  fontSize: 12,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 70,
                                  width: 1,
                                  color: AppTheme.themeColors.secondary,
                                ),
                                Expanded(
                                  flex: 49,
                                  child: Column(
                                    children: [
                                      TextWidget.bold(
                                        text: "Guests Arrived",
                                        color: AppTheme.themeColors.text,
                                        fontSize: 12,
                                      ),
                                      Divider(
                                        color: AppTheme.themeColors.secondary,
                                        thickness: 1,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                TextWidget.normal(
                                                  text: "Adult's",
                                                  color: AppTheme.themeColors.text,
                                                  fontSize: 12,
                                                ),
                                                TextWidget.normal(
                                                  text: controller.invitationList?[index].attended ?? "0",
                                                  color: AppTheme.themeColors.text,
                                                  fontSize: 12,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                TextWidget.normal(
                                                  text: "Children's",
                                                  color: AppTheme.themeColors.text,
                                                  fontSize: 12,
                                                ),
                                                TextWidget.normal(
                                                  text: controller.invitationList?[index].childrenAttended ?? "0",
                                                  color: AppTheme.themeColors.text,
                                                  fontSize: 12,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                TextWidget.bold(
                                                  text: "Total Guest's",
                                                  color: AppTheme.themeColors.text,
                                                  fontSize: 12,
                                                ),
                                                TextWidget.bold(
                                                  text: (int.parse(controller.invitationList?[index].attended ?? "0")
                                                      + int.parse(controller.invitationList?[index].childrenAttended ?? "0")).toString(),
                                                  color: AppTheme.themeColors.text,
                                                  fontSize: 12,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ]
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
