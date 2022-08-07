
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hayyacom/utils/utils.dart';

void showToast(String message) {
  EasyLoading.showToast(
    message,
    toastPosition: EasyLoadingToastPosition.bottom,
  );
}