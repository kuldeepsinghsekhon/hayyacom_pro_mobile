import 'package:get/get.dart';

import 'controller.dart';


class EventListingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventListingController>(() => EventListingController());
  }
}