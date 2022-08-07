import 'dart:convert';

import 'package:hayyacom/models/core/api_response.dart';
import 'package:hayyacom/models/user_model.dart';
import 'package:hayyacom/utils/constants/api_urls.dart';
import 'package:hayyacom/utils/shared_preferences/index.dart';

import 'api_call_handler/index.dart';

class LoginRepository {

  static Future<ApiResponse> login({String? phone, String? password, String? eventId, int? selectedUser}) {
    Map<String, String> body = {
      "phoneNumber": phone!,
      "password": password!,
      // "event_id": eventId!.toUpperCase(),
    };

    switch(selectedUser) {
      case 1:
        body["selectedUser"] = "Receptionist";
        break;
      case 2:
        body["selectedUser"] = "Inviter";
        break;
      case 3:
        break;
      default:
        "";
    }
    return APICallHandler().postRequest(selectedUser == 3
        ? APIUrls.newLoginApi : APIUrls.oldLoginApi, body).then((value) =>
      ApiResponse(status: value.status, data: value.status
          ? saveUserDetails(value.data, selectedUser) : null, message: value.message));
  }

  static UserModel saveUserDetails(data, int? selectedUser) {
    UserModel userModel = selectedUser == 3
        ? UserModel.fromJson(data) : UserModel.fromOldJson(data);
    PreferencesHandler.setUserDate(userModel);
    return userModel;
  }
}