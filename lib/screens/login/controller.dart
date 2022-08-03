import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int selectedUser = 1;
  String phoneNo = "";
  String password = "";
  String eventId = "";
  bool isLoading = false;
  bool isPasswordVisible = false;

  void updateSelectedUser(int user) {
    selectedUser = user;
    update();
  }

  void validate() {
    if(formKey.currentState?.validate() ?? false) {
      formKey.currentState!.save();
      updateLoading();
      // onDelete(CustomerModel(id: id, password: password, note: note));
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

}