import 'package:hayyacom/models/core/api_response.dart';
import 'package:hayyacom/models/event_model.dart';
import 'package:hayyacom/utils/constants/api_urls.dart';

import 'api_call_handler/index.dart';

class EventsRepository {
  static Future<ApiResponse> getEventsList(int id) {
    return APICallHandler().getRequest(APIUrls.eventListApi(id)).then((value) =>
      ApiResponse(status: value.status, data: value.status
          ? getList(value.data) : null, message: value.message));
  }

  static List<EventModel> getList(data) {
    List<EventModel> eventList = [];
    for (var element in (data["data"])) {
      eventList.add(EventModel.fromJson(element));
    }
    return eventList;
  }
}