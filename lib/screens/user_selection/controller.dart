import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayyacom/utils/constants/navigation_params.dart';
import 'package:hayyacom/utils/enums/user_types.dart';
import 'package:hayyacom/utils/utils.dart';

class UserSelectionController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void navigateToLoginScreen(UserType userType) {
    Get.toNamed(Routes.login, arguments: {
      NavigationParams.userType: userType
    });
  }

}