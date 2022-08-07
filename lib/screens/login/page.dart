import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayyacom/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) =>
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
                      text: "Hayyacom",
                      fontSize: 10.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: TextWidget.normal(
                      text: "Login as a تسجيل الدخول",
                      fontSize: 3.h,
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        flex: 33,
                        child: Button(
                          onTap: () => controller.updateSelectedUser(1),
                          color: controller.selectedUser == 1
                              ? AppTheme.themeColors.darkGray
                              : AppTheme.themeColors.dimGray,
                          title: "Receptionist\nموظف",
                          titleSize: 2.h,
                          titleColor: controller.selectedUser == 1
                              ? AppTheme.themeColors.base
                              : AppTheme.themeColors.text,
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 33,
                        child: Button(
                          onTap: () => controller.updateSelectedUser(2),
                          color: controller.selectedUser == 2
                              ? AppTheme.themeColors.darkGray
                              : AppTheme.themeColors.dimGray,
                          title: "Inviter\nصاحب المناسبة",
                          titleSize: 2.h,
                          titleColor: controller.selectedUser == 2
                              ? AppTheme.themeColors.base
                              : AppTheme.themeColors.text,
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 33,
                        child: Button(
                          onTap: () => controller.updateSelectedUser(3),
                          color: controller.selectedUser == 3
                              ? AppTheme.themeColors.darkGray
                              : AppTheme.themeColors.dimGray,
                          title: "Hayyacom\nصاحب المناسبة",
                          titleSize: 2.h,
                          titleColor: controller.selectedUser == 3
                              ? AppTheme.themeColors.base
                              : AppTheme.themeColors.text,
                        ),
                      ),
                    ],
                  ),

                ],
              ),

              Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
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
                      visible: controller.selectedUser == 1,
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

              Button(
                onTap: () => controller.validate(),
                color: AppTheme.themeColors.darkGray,
                buttonSize: 7.h,
                title: "Login",
                titleSize: 3.h,
                titleColor: AppTheme.themeColors.base,
              ),
            ],
          ),
        )
      ),
    ));
  }
}
