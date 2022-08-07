class APIUrls {
  ///   Live
  static const String oldAppBaseURL = 'https://hayyacom.net/QRscannerapp';
  static const String newAppBaseURL = 'https://hayyacom.net/mobile/api';
  ///  Testing
//   static const String baseURL = 'http://aquatecinnovative.co.in:3001';
//   static const String baseURL = 'https://qrscanner.aquatecinnovative.co.in/';

  static String oldLoginApi =  "$oldAppBaseURL/api/login";
  static String newLoginApi =  "$newAppBaseURL/auth/login";
  static eventListApi(int id) => "$newAppBaseURL/events/user/$id";
}