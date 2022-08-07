import 'package:get/get.dart';

import 'controller.dart';

class NewInviterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewInviterController>(() => NewInviterController());
  }
}