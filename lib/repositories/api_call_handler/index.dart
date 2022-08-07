import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:hayyacom/models/core/api_response.dart';

class APICallHandler {

  Duration timeOut = const Duration(seconds: 15);
  int success = 200;

  Map<String, String> headers = {HttpHeaders.contentTypeHeader: "application/json",};
  bool checkInternet(onError) => onError.toString().toLowerCase().contains("SocketException".toLowerCase());
  ApiResponse onCatchError(onError) => ApiResponse(status: false,
      message: checkInternet(onError)
          ? "Please check internet connection"
          : onError.toString());
  ApiResponse onTimeOut = ApiResponse(status: false, message: "Request time-out");

  Future<ApiResponse> postRequest(String url, Map<String, dynamic> params) {
    return http.post(Uri.parse(url), body: json.encode(params), headers: headers).then((value) {
      if(value.statusCode == success) {
        return ApiResponse(status: true, data: json.decode(value.body));
      } else {
        return ApiResponse(status: false, message: (json.decode(value.body).toString()));
      }
    }).onError((error, stackTrace) => onCatchError(error))
      .catchError((onError) => onCatchError(onError))
      .timeout(timeOut, onTimeout: () => onTimeOut);
  }

  Future<ApiResponse> getRequest(String url) {
    return http.get(Uri.parse(url), headers: headers).then((value) {
      if(value.statusCode == success) {
        return ApiResponse(status: true, data: json.decode(value.body));
      } else {
        return ApiResponse(status: false, message: (json.decode(value.body).toString()));
      }
    }).onError((error, stackTrace) => onCatchError(error))
        .catchError((onError) => onCatchError(onError))
        .timeout(timeOut, onTimeout: () => onTimeOut);
  }

}