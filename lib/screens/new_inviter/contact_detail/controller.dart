import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:hayyacom/models/event_model.dart';
import 'package:hayyacom/repositories/invitations.dart';
import 'package:hayyacom/utils/shared_preferences/index.dart';
import 'package:hayyacom/utils/utils.dart';

class ContactDetailController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  EventModel? event;
  Contact contact;

  int adultCount = 1;
  int childCount = 0;
  int totalGuestCount = 1;

  bool isPermissionDenied = false;
  bool isLoading = false;

  ContactDetailController({required this.contact, required this.event});

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

  void sendInvitation() {
    triggerLoading();
    PreferencesHandler.getUserId().then((userId) {
      Map<String, dynamic> params = {
      "phoneNumber": contact.phones.first.number,
      "name": contact.displayName,
      "total_guest": adultCount,
      "total_children": childCount,
      "EventId": event?.id,
      "UserId": 1,
      "DesignId": event?.designId,
      };
      InvitationsRepository.createSingleInvitation(params).then((value) {
        triggerLoading();
        if(value.status) {
          showToast("Invitation Sent");
          Get.back();
        } else {
          showToast(value.message!);
        }
      });
    }).catchError((onError) {triggerLoading();});


  }

  void triggerLoading () {
    isLoading = !isLoading;
    update();
  }

}