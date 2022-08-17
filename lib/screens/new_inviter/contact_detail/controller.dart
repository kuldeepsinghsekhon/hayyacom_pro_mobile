import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:hayyacom/models/event_model.dart';
import 'package:hayyacom/utils/constants/navigation_params.dart';

class ContactDetailController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  EventModel? eventModel;

  List<Contact>? contacts;

  bool isPermissionDenied = false;
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    eventModel = Get.arguments[NavigationParams.eventModel];
    fetchContacts();
  }

  Future fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      isPermissionDenied = true;
    } else {
      contacts = await FlutterContacts.getContacts();
    }
    isLoading = false;
    update();
  }

  void navigateToContactList() {

  }

}