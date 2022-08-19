import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:hayyacom/models/event_model.dart';
import 'package:hayyacom/utils/constants/navigation_params.dart';

class ContactDetailController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  EventModel? eventModel;

  Contact contact;

  int adultCount = 1;
  int childCount = 0;
  int totalGuestCount = 1;

  bool isPermissionDenied = false;
  bool isLoading = true;

  ContactDetailController({required this.contact});

  void navigateToContactList() {

  }

  updateAdultCount({required bool isIncrement}) {
    totalGuestCount = 0;
    if(isIncrement) {
      adultCount ++;
    } else {
      adultCount --;
      if(adultCount < 1 ) adultCount = 1;
    }
    totalGuestCount = adultCount + childCount;
    update();
  }

  updateChildCount({required bool isIncrement}) {
    totalGuestCount = 0;
    if(isIncrement) {
      childCount ++;
    } else {
      childCount --;
      if(childCount < 0 ) childCount = 0;
    }
    totalGuestCount = adultCount + childCount;
    update();
  }

}