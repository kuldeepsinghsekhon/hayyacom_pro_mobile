import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayyacom/repositories/login.dart';
import 'package:hayyacom/utils/shared_preferences/index.dart';
import 'package:hayyacom/utils/utils.dart';

class NewInviterController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = "";

  @override
  void onInit() {
    super.onInit();
    PreferencesHandler.getUserName().then((dynamic value) {
      name = value;
      update();
    });
  }

}