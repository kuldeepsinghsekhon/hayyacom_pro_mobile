import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayyacom/utils/constants/assets_images.dart';
import 'package:hayyacom/utils/enums/user_types.dart';
import 'package:hayyacom/utils/global_widgets/background.dart';
import 'package:hayyacom/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'controller.dart';

class UserSelectionView extends GetView<UserSelectionController> {
  const UserSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserSelectionController>(builder: (_) =>
      BackgroundWidget(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 1.h),
                    child: TextWidget.bold(
                      text: "Select User",
                      fontSize: 2.5.h,
                    ),
                  ),
                  ///   Type of users
                  Row(
                    children: [
                      Expanded(
                        flex: 32,
                        child: InkWell(
                          onTap: () => controller.navigateToLoginScreen(UserType.inviter),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                            decoration: BoxDecoration(
                              color: AppTheme.themeColors.base,
                              border: Border.all(
                                width: 1,
                                color: AppTheme.themeColors.secondary),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                IconButtonWidget(
                                  icon: Icons.insert_invitation,
                                  backgroundColor: AppTheme.themeColors.transparent,
                                  iconColor: AppTheme.themeColors.secondary,
                                  iconSize: 4.5.h,
                                ),
                                TextWidget.bold(
                                  text: "Inviter",
                                  textAlign: TextAlign.center,
                                  fontSize: 4.w,
                                ),
                                TextWidget.bold(
                                  text: "صاحب المناسبة",
                                  textAlign: TextAlign.center,
                                  fontSize: 3.5.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 1.w,),
                      Expanded(
                        flex: 32,
                        child: InkWell(
                          onTap: () => controller.navigateToLoginScreen(UserType.receptionist),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                            decoration: BoxDecoration(
                              color: AppTheme.themeColors.base,
                              border: Border.all(
                                  width: 1,
                                  color: AppTheme.themeColors.secondary),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                IconButtonWidget(
                                  icon: Icons.person,
                                  backgroundColor: AppTheme.themeColors.transparent,
                                  iconColor: AppTheme.themeColors.secondary,
                                  iconSize: 4.5.h,
                                ),
                                TextWidget.bold(
                                  text:"Receptionist",
                                  textAlign: TextAlign.center,
                                  fontSize: 4.w,
                                ),
                                TextWidget.bold(
                                  text:"موظف",
                                  textAlign: TextAlign.center,
                                  fontSize: 3.5.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 1.w,),
                      Expanded(
                        flex: 32,
                        child: InkWell(
                          onTap: () => controller.navigateToLoginScreen(UserType.goldOrDiamond),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                            decoration: BoxDecoration(
                              color: AppTheme.themeColors.base,
                              border: Border.all(
                                  width: 1,
                                  color: AppTheme.themeColors.secondary),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                IconButtonWidget(
                                  icon: Icons.group,
                                  backgroundColor: AppTheme.themeColors.transparent,
                                  iconColor: AppTheme.themeColors.secondary,
                                  iconSize: 4.5.h,
                                ),
                                TextWidget.bold(
                                  text:"Gold/Diamond",
                                  textAlign: TextAlign.center,
                                  fontSize: 4.w,
                                ),
                                TextWidget.bold(
                                  text:"باقة ذهبية/ ماسية",
                                  textAlign: TextAlign.center,
                                  fontSize: 3.5.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
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
    );
  }
}
