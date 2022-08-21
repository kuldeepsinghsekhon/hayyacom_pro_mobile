import 'package:hayyacom/models/core/api_response.dart';
import 'package:hayyacom/models/invitation_model.dart';
import 'package:hayyacom/utils/constants/api_urls.dart';

import 'api_call_handler/index.dart';

class InvitationsRepository {
  static Future<ApiResponse> createSingleInvitation(Map<String, dynamic> params) {
    return APICallHandler().postRequestWithToken(APIUrls.createSingleInvitationApi, params).then((value) =>
        ApiResponse(status: value.status, data: null, message: value.message));
  }

  static Future<ApiResponse> getInvitations(int userId, int eventId) {
    return APICallHandler().getRequest(APIUrls.invitationListApi(userId, eventId), ).then((value) =>
        ApiResponse(status: value.status, data: value.status
            ? getList(value.data) : null, message: value.message));
  }
  static List<InvitationModel> getList(data) {
    List<InvitationModel> eventList = [];
    for (var element in (data["data"]?["invitation"])) {
      eventList.add(InvitationModel.fromJson(element));
    }
    return eventList;
  }
}