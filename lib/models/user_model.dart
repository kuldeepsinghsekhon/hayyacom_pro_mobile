class UserModel {
/*
{
  "id": 1,
  "name": "danish",
  "phoneNumber": "917508884086",
  "password": "111",
  "language": "en_US",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjU5MzYzMTM2fQ.NpiOj_QOMYx9S2hvSrDgrxItUZA0giSiFwmkGmxcieY",
  "message": "Login Successfull!",

  ///   Old API Response
  "Iname": "test",
  "Ievent": 77,
  "Itotalguest": 200,
  "Iredirecto": "null",
  "entranceUrl": "https://hayyacom.net/public/photo/iflowerinvitation/appevent562347473.jpg",
  "letterUrl": "null",
  "packagetype": "Regular"
}
*/

  int? id;
  String? name;
  String? phoneNumber;
  String? password;
  String? language;
  String? token;
  String? message;
  int? eventId;
  int? totalGuest;
  String? sampleInvitationURL;
  String? invitationURL;
  String? invitationRedirectionURL;
  String? packageType;

  UserModel({
    this.id,
    this.name,
    this.phoneNumber,
    this.password,
    this.language,
    this.token,
    this.message,
    this.eventId,
    this.totalGuest,
    this.sampleInvitationURL,
    this.invitationURL,
    this.invitationRedirectionURL,
    this.packageType,
  });

  UserModel.fromOldJson(Map<String, dynamic> json) {
    name = json['Iname']?.toString();
    eventId = int.tryParse(json['Ievent']?.toString() ?? '');
    totalGuest = int.tryParse(json['Itotalguest']?.toString() ?? '');
    invitationRedirectionURL = json['Iredirecto']?.toString();
    sampleInvitationURL = json['entranceUrl']?.toString();
    invitationURL = json['letterUrl']?.toString();
    packageType = json['packagetype']?.toString();
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['data']?['id']?.toString() ?? '');
    name = json['data']?['name']?.toString();
    phoneNumber = json['data']?['phoneNumber']?.toString();
    password = json['data']?['password']?.toString();
    language = json['data']?['language']?.toString();
    token = json['token']?.toString();
    message = json['message']?.toString();
  }

  Map<String, dynamic> toOldJson() {
    final data = <String, dynamic>{};
    data['Iname'] = name;
    data['Ievent'] = eventId;
    data['Itotalguest'] = totalGuest;
    data['Iredirecto'] = invitationRedirectionURL;
    data['entranceUrl'] = sampleInvitationURL;
    data['letterUrl'] = invitationURL;
    data['packagetype'] = packageType;
    return data;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    data['language'] = language;
    data['token'] = token;
    data['message'] = message;
    return data;
  }
}
