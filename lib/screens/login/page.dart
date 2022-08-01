import 'package:flutter/material.dart';
import 'package:hayyacom/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    padding: EdgeInsets.only(bottom: 3.h),
                    child: TextWidget.bold(
                      text: "Hayyacom",
                      fontSize: 10.h,
                    ),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
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
                          onTap: () {},
                          color: AppTheme.themeColors.darkGray,
                          title: "Receptionist\nموظف",
                          titleSize: 2.h,
                          titleColor: AppTheme.themeColors.base,
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 33,
                        child: Button(
                          onTap: () {},
                          color: AppTheme.themeColors.dimGray,
                          title: "Inviter\nصاحب المناسبة",
                          titleSize: 2.h,
                          titleColor: AppTheme.themeColors.text,
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 33,
                        child: Button(
                          onTap: () {},
                          color: AppTheme.themeColors.dimGray,
                          title: "Hayyacom\nصاحب المناسبة",
                          titleSize: 2.h,
                          titleColor: AppTheme.themeColors.text,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: TextFieldWidget(
                      // controller: phoneController,
                      prefixIcon: Icons.phone_android,
                      labelText: "Mobile Number رقم الهاتف المحمول",
                      hintText: "Mobile Number رقم الهاتف المحمول",
                      // validator: validatePhoneNumber,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: TextFieldWidget(
                      // controller: phoneController,
                      prefixIcon: Icons.lock,
                      suffixIcon: true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      labelText: "Password كلمه السر",
                      hintText: "Password كلمه السر",
                      // validator: validatePhoneNumber,
                      onSuffixIconTap: () {},
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: TextFieldWidget(
                      // controller: phoneController,
                      prefixIcon: Icons.event,
                      labelText: "Event Id رقم الحفله",
                      hintText: "Event Id رقم الحفله",
                      // validator: validatePhoneNumber,
                    ),
                  ),
                ],
              ),

              Button(
                onTap: () {},
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
    );
  }
}
