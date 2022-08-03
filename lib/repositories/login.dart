import 'package:hayyacom/utils/constants/api_urls.dart';

import 'api_call_handler/index.dart';

class LoginRepository {
  void login({String? phone, String? password, String? eventId, String? selectedUser}) {
    Map<String, String> body = {
      "mobileNumber": phone!,
      "password": password!,
      "event_id": eventId!.toUpperCase(),
      "selectedUser": selectedUser!,
    };

    APICallHandler().postRequest(APIUrls.loginApi, body).then((value) {
      if(value.status) {
        saveUserDetails(value.data);
      } else {

      }
    });
  }

  void saveUserDetails(data) {

  }
}