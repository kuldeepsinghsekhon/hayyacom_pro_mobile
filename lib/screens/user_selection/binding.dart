import 'package:get/get.dart';

import 'controller.dart';


class UserSelectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserSelectionController>(() => UserSelectionController());
  }
}