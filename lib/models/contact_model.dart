class ContactModel {
/*
{
  "id": 4,
  "guestname": "111",
  "guestmobile": "9175081884306",
  "UserId": "null",
  "EventId": "null"
}
*/

  int? id;
  String? guestName;
  String? guestMobile;
  String? userId;
  String? eventId;

  ContactModel({
    this.id,
    this.guestName,
    this.guestMobile,
    this.userId,
    this.eventId,
  });

  ContactModel.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id']?.toString() ?? '');
    guestName = json['guestname']?.toString();
    guestMobile = json['guestmobile']?.toString();
    userId = json['UserId']?.toString();
    eventId = json['EventId']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['guestname'] = guestName;
    data['guestmobile'] = guestMobile;
    data['UserId'] = userId;
    data['EventId'] = eventId;
    return data;
  }
}