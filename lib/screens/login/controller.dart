import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayyacom/repositories/login.dart';
import 'package:hayyacom/utils/constants/navigation_params.dart';
import 'package:hayyacom/utils/enums/user_types.dart';
import 'package:hayyacom/utils/utils.dart';

class LoginController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String phoneNo = "";
  String password = "";
  String eventId = "";
  bool isLoading = false;
  bool isPasswordVisible = false;

  UserType? userType;

  @override
  void onInit() {
    super.onInit();
    userType = Get.arguments[NavigationParams.userType];
  }

  void validate() {
    if(formKey.currentState?.validate() ?? false) {
      formKey.currentState!.save();
      updateLoading();
      login();
    }
  }

  void updateLoading () {
    isLoading = !isLoading;
    update();
  }

  void updatePasswordVisibility () {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  void login() {
    showLoader();
    LoginRepository.login(
      phone: phoneNo,
      password: password,
      eventId: eventId,
      selectedUser: userType).then((value) {
        Get.back();
        if(value.status) {
          showToast("Login Successfully");
          navigateToEventScreen();
        } else {
          showToast(value.message ?? "");
        }
    });
  }

  void navigateToEventScreen() {
    Get.offAllNamed(Routes.eventListing);
  }

}