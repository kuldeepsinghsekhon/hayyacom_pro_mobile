class EventModel {
/*
{
  "EventId": 1,
  "DesignId": 1,
  "EventDate": "11/02/2023"
} 
*/

  int? eventId;
  int? designId;
  String? eventDate;

  EventModel({
    this.eventId,
    this.designId,
    this.eventDate,
  });

  EventModel.fromJson(Map<String, dynamic> json) {
    eventId = int.tryParse(json['EventId']?.toString() ?? '');
    designId = int.tryParse(json['DesignId']?.toString() ?? '');
    eventDate = json['EventDate']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['EventId'] = eventId;
    data['DesignId'] = designId;
    data['EventDate'] = eventDate;
    return data;
  }
}