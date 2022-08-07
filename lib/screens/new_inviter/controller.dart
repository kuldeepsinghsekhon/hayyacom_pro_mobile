import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayyacom/models/event_model.dart';
import 'package:hayyacom/repositories/events.dart';
import 'package:hayyacom/utils/shared_preferences/index.dart';
import 'package:hayyacom/utils/utils.dart';

class NewInviterController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = "";

  List<EventModel>? eventsList;

  @override
  void onInit() {
    super.onInit();
    PreferencesHandler.getUserName().then((dynamic value) {
      name = value.toString().capitalize!;
      update();
    });
    fetchEvents();
  }

  void fetchEvents() {
    PreferencesHandler.getUserId().then((dynamic id) =>
      EventsRepository.getEventsList(id).then((value) {
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

}