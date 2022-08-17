import 'package:get/get.dart';

import 'controller.dart';


class ContactDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactDetailController>(() => ContactDetailController());
  }
}