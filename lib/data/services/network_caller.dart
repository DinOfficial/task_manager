import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/data/utils/auth_controller.dart';

class NetWorkCaller {


  // get request network caller
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url);

      final response = await http.get(uri);
      _logResponse(url, response);
      final decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          responseCode: response.statusCode,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
          errorMessage: decodedResponse['body'],
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        responseCode: -1,
        errorMessage: e.toString(),
      );
    }
  }


  // post request network caller
  Future<NetworkResponse> postRequest( String url,{Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url);
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'token' : ?AuthController.accessToken,
        },
        body: jsonEncode(body),
      );
      _logResponse(url, response);
      final Map<String, dynamic> decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200 && decodedResponse['status'] == 'success') {
        return NetworkResponse(
          isSuccess: true,
          responseCode: response.statusCode,
          body: decodedResponse,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
          errorMessage: decodedResponse['data'],
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      return NetworkResponse(
        isSuccess: false,
        responseCode: -1,
        errorMessage: e.toString(),
      );
    }
  }
  void _logRequest(String url){
    debugPrint('Request: $url');
  }

  void _logResponse(String url, dynamic response){
    debugPrint('Url: $url\n'
        'Response: ${response.statusCode}\n'
        'Body: ${response.body}');
  }
}

class NetworkResponse {
  final bool isSuccess;
  final int responseCode;
  final dynamic body;
  final String? errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.responseCode,
    this.body,
    this.errorMessage,
  });
}
