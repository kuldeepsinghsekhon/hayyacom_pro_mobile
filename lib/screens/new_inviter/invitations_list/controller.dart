import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayyacom/models/invitation_model.dart';
import 'package:hayyacom/repositories/invitations.dart';
import 'package:hayyacom/utils/constants/navigation_params.dart';
import 'package:hayyacom/utils/shared_preferences/index.dart';
import 'package:hayyacom/utils/utils.dart';

class InvitationListingController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<InvitationModel>? invitationList;

  late int eventId;

  @override
  void onInit() {
    super.onInit();
    eventId = Get.arguments[NavigationParams.eventId];
    fetchInvitations();
  }

  void fetchInvitations() {
    PreferencesHandler.getUserId().then((userId) =>
      InvitationsRepository.getInvitations(1, eventId).then((value) {
       if(value.status) {
         invitationList = value.data;
         update();
       } else {
         showToast(value.message!);
         invitationList = [];
         update();
       }
      })
    );

  }

  void navigateToContactDetail() {
    // GeneralDialog.show(child: ContactDetailView(contact: contact, event: eventModel!));
  }

}