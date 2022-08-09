import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayyacom/models/event_model.dart';
import 'package:hayyacom/repositories/events.dart';
import 'package:hayyacom/utils/constants/navigation_params.dart';
import 'package:hayyacom/utils/shared_preferences/index.dart';
import 'package:hayyacom/utils/utils.dart';

class ContactListingController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = "";

  EventModel? eventModel;

  List<EventModel>? eventsList;

  @override
  void onInit() {
    super.onInit();
    eventModel = Get.arguments[NavigationParams.eventModel];
  }

  void fetchEvents() {
    PreferencesHandler.getUserId().then((dynamic id) =>
      EventsRepository.getEventsList(1).then((value) {
        if(value.status) {
          eventsList = value.data;
          update();
        } else {
          eventsList = [];
          showToast(value.message ?? "");
          update();
        }
      }));
  }

  void navigateToContactList() {

  }

}