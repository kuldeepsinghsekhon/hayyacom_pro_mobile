import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hayyacom/models/core/api_response.dart';

class APICallHandler {

  Duration timeOut = const Duration(seconds: 5);
  int success = 200;

  bool checkInternet(onError) => onError.toString().toLowerCase().contains("SocketException".toLowerCase());
  ApiResponse onCatchError(onError) => ApiResponse(status: false,
      message: checkInternet(onError)
          ? "Please check internet connection"
          : onError.toString());
  ApiResponse onTimeOut = ApiResponse(status: false, message: "Request time-out");

  Future<ApiResponse> postRequest(String url, Map<String, dynamic> params) {
    return Dio().post(url, queryParameters: params)
      .then((value) {
        if(value.statusCode == success) {
          return ApiResponse(status: true, data: JsonDecoder(value.data));
        } else {
          return ApiResponse(status: false, message: (JsonDecoder(value.data).toString()));
        }
      }).onError((error, stackTrace) => onCatchError(error))
        .catchError((onError) => onCatchError(onError))
        .timeout(timeOut, onTimeout: () => onTimeOut);
  }

}