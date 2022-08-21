class MessageModel {
/*
{
  "id": 1,
  "save_qr_message": "please save qr code",
  "message_title": "Hello, we would like to invite you to our Birthday",
  "remider": "Hello, we would like to invite you to our Birthday",
  "RSVP": "Please accept or decline the invitation via the following link\n",
  "Guest_name_title": "MR",
  "note_message": "hello",
  "DesignId": 1
} 
*/

  int? id;
  String? saveQrMessage;
  String? messageTitle;
  String? reminder;
  String? rsvp;
  String? guestNameTitle;
  String? noteMessage;
  int? designId;

  MessageModel({
    this.id,
    this.saveQrMessage,
    this.messageTitle,
    this.reminder,
    this.rsvp,
    this.guestNameTitle,
    this.noteMessage,
    this.designId,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id']?.toString() ?? '');
    saveQrMessage = json['save_qr_message']?.toString();
    messageTitle = json['message_title']?.toString();
    reminder = json['remider']?.toString();
    rsvp = json['RSVP']?.toString();
    guestNameTitle = json['Guest_name_title']?.toString();
    noteMessage = json['note_message']?.toString();
    designId = int.tryParse(json['DesignId']?.toString() ?? '');
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['save_qr_message'] = saveQrMessage;
    data['message_title'] = messageTitle;
    data['remider'] = reminder;
    data['RSVP'] = rsvp;
    data['Guest_name_title'] = guestNameTitle;
    data['note_message'] = noteMessage;
    data['DesignId'] = designId;
    return data;
  }
}