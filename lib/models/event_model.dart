class EventModel {
/*
{
  "id": 1,
  "locationurl": "sad",
  "type": "sdsad",
  "packagetype": "null",
  "paperAttendence": "null",
  "totalguest": "null",
  "eventDate": "11/02/2023",
  "eventtitle": "null",
  "notes": "dd",
  "DesignId": 1
}
*/

  int? id;
  String? locationUrl;
  String? type;
  String? packageType;
  String? paperAttendance;
  String? totalGuest;
  String? eventDate;
  String? eventTitle;
  String? notes;
  int? designId;

  EventModel({
    this.id,
    this.locationUrl,
    this.type,
    this.packageType,
    this.paperAttendance,
    this.totalGuest,
    this.eventDate,
    this.eventTitle,
    this.notes,
    this.designId,
  });

  EventModel.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id']?.toString() ?? '');
    locationUrl = json['locationurl']?.toString();
    type = json['type']?.toString();
    packageType = json['packagetype']?.toString();
    paperAttendance = json['paperAttendence']?.toString();
    totalGuest = json['totalguest']?.toString();
    eventDate = json['eventDate']?.toString();
    eventTitle = json['eventtitle']?.toString();
    notes = json['notes']?.toString();
    designId = int.tryParse(json['DesignId']?.toString() ?? '');
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['locationurl'] = locationUrl;
    data['type'] = type;
    data['packagetype'] = packageType;
    data['paperAttendence'] = paperAttendance;
    data['totalguest'] = totalGuest;
    data['eventDate'] = eventDate;
    data['eventtitle'] = eventTitle;
    data['notes'] = notes;
    data['DesignId'] = designId;
    return data;
  }
}