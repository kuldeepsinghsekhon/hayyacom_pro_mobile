import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:hayyacom/models/event_model.dart';
import 'package:hayyacom/screens/new_inviter/contact_detail/page.dart';
import 'package:hayyacom/utils/constants/navigation_params.dart';
import 'package:hayyacom/utils/global_widgets/general_dialog/index.dart';
import 'package:hayyacom/utils/utils.dart';

class ContactListingController extends GetxController {

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

  void navigateToContactDetail(Contact contact) {
    GeneralDialog.show(child: ContactDetailView(contact: contact));
    // Get.toNamed(Routes.contactDetail, arguments: {NavigationParams.contactModel: contact});
  }

}