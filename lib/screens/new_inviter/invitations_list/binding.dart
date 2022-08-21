import 'package:get/get.dart';

import 'controller.dart';


class InvitationListingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvitationListingController>(() => InvitationListingController());
  }
}