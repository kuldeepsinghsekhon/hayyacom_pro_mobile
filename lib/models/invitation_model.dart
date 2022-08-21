import 'contact_model.dart';

class InvitationModel {
/*
{
  "id": 2,
  "total_guest": "5",
  "status": "null",
  "confirmed": "null",
  "attended": "null",
  "total_children": "1",
  "childrenattended": "null",
  "checkintime": "null",
  "UserId": 1,
  "EventId": 1,
  "ContactId": 4,
  "DesignId": 1,
  "Contact": {
    "id": 4,
    "guestname": "111",
    "guestmobile": "9175081884306",
    "UserId": "null",
    "EventId": "null"
  }
}
*/

  int? id;
  String? totalGuest;
  String? status;
  String? confirmed;
  String? attended;
  String? totalChildren;
  String? childrenAttended;
  String? checkInTime;
  int? userId;
  int? eventId;
  int? contactId;
  int? designId;
  ContactModel? contact;

  InvitationModel({
    this.id,
    this.totalGuest,
    this.status,
    this.confirmed,
    this.attended,
    this.totalChildren,
    this.childrenAttended,
    this.checkInTime,
    this.userId,
    this.eventId,
    this.contactId,
    this.designId,
    this.contact,
  });

  InvitationModel.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id']?.toString() ?? '');
    totalGuest = json['total_guest']?.toString();
    status = json['status']?.toString();
    confirmed = json['confirmed']?.toString();
    attended = json['attended']?.toString();
    totalChildren = json['total_children']?.toString();
    childrenAttended = json['childrenattended']?.toString();
    checkInTime = json['checkintime']?.toString();
    userId = int.tryParse(json['UserId']?.toString() ?? '');
    eventId = int.tryParse(json['EventId']?.toString() ?? '');
    contactId = int.tryParse(json['ContactId']?.toString() ?? '');
    designId = int.tryParse(json['DesignId']?.toString() ?? '');
    contact = (json['Contact'] != null && (json['Contact'] is Map)) ? ContactModel.fromJson(json['Contact']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['total_guest'] = totalGuest;
    data['status'] = status;
    data['confirmed'] = confirmed;
    data['attended'] = attended;
    data['total_children'] = totalChildren;
    data['childrenattended'] = childrenAttended;
    data['checkintime'] = checkInTime;
    data['UserId'] = userId;
    data['EventId'] = eventId;
    data['ContactId'] = contactId;
    data['DesignId'] = designId;
    if (contact != null) {
      data['Contact'] = contact!.toJson();
    }
    return data;
  }
}
