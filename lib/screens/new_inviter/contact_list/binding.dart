import 'package:get/get.dart';

import 'controller.dart';


class ContactListingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactListingController>(() => ContactListingController());
  }
}