import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayyacom/utils/constants/assets_images.dart';
import 'package:hayyacom/utils/enums/user_types.dart';
import 'package:hayyacom/utils/global_widgets/background.dart';
import 'package:hayyacom/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) => BackgroundWidget(
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButtonWidget(
                      onTap: () => Get.back(),
                      icon: Icons.arrow_back,
                      iconColor: AppTheme.themeColors.text,
                      iconSize: 24,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 1.h),
                  child: TextWidget.bold(
                    text: "Log in as ${User.getEnUserType(controller.userType!)}",
                    fontSize: 2.5.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: TextWidget.bold(
                    text: "تسجيل الدخول ${User.getArUserType(controller.userType!)}",
                    fontSize: 2.5.h,
                  ),
                ),
                Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: TextFieldWidget(
                          prefixIcon: Icons.phone_android,
                          labelText: "Mobile Number رقم الهاتف المحمول",
                          hintText: "0000000000",
                          validator: FormValidation.phoneValidation,
                          onSaved: (val) => controller.phoneNo = val?.trim() ?? "",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: TextFieldWidget(
                          prefixIcon: Icons.lock,
                          suffixIcon: !controller.isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          labelText: "Password كلمه السر",
                          hintText: "********",
                          obscureText: controller.isPasswordVisible,
                          validator: FormValidation.passwordValidation,
                          onSaved: (val) => controller.password = val?.trim() ?? "",
                          onSuffixIconTap: () => controller.updatePasswordVisibility(),
                        ),
                      ),
                      Visibility(
                        visible: controller.userType == UserType.receptionist,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFieldWidget(
                            prefixIcon: Icons.event,
                            labelText: "Event Id رقم الحفله",
                            hintText: "00",
                            validator: FormValidation.eventValidation,
                            onSaved: (val) => controller.eventId = val?.trim() ?? "",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: Button(
                    onTap: () => controller.validate(),
                    color: AppTheme.themeColors.inverse,
                    buttonSize: 7.h,
                    title: "Login",
                    titleSize: 3.h,
                    titleColor: AppTheme.themeColors.text,
                  ),
                ),
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
    ));
  }
}
