import 'package:hayyacom/models/core/api_response.dart';
import 'package:hayyacom/models/user_model.dart';
import 'package:hayyacom/utils/constants/api_urls.dart';
import 'package:hayyacom/utils/enums/user_types.dart';
import 'package:hayyacom/utils/shared_preferences/index.dart';

import 'api_call_handler/index.dart';

class LoginRepository {

  static Future<ApiResponse> login({String? phone, String? password, String? eventId, UserType? selectedUser}) {
    Map<String, String> body = {
      "phoneNumber": phone!,
      "password": password!,
      "selectedUser": User.getEnUserType(selectedUser!),
      "event_id": eventId!.toUpperCase(),
    };

    return APICallHandler().postRequest(selectedUser == UserType.goldOrDiamond
        ? APIUrls.newLoginApi : APIUrls.oldLoginApi, body).then((value) =>
      ApiResponse(status: value.status, data: value.status
          ? saveUserDetails(value.data, selectedUser) : null, message: value.message));
  }

  static UserModel saveUserDetails(data, UserType? selectedUser) {
    UserModel userModel = selectedUser == UserType.goldOrDiamond
        ? UserModel.fromJson(data) : UserModel.fromOldJson(data);
    PreferencesHandler.setUserDate(userModel);
    return userModel;
  }
}