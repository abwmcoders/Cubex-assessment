import 'dart:convert';
import 'dart:io';

import 'package:cubex_assessment/src/core/resources/constants.dart';
import 'package:http/http.dart' as http;

class BaseServices {
  static const baseUrl = Constants.baseUrl;

  Future postRequest({required String url, dynamic data}) async {
    print("Inside post request");
    const String url0 = baseUrl;
    var headers = {
      'Content-Type': 'application/json',
      'accept': 'application/json',
    };
    try {
      print("Inside post catxchg");
      final String endPoint = url0 + url;
      print("ENDPOINT ====> $endPoint");
      final response = await http
          .post(Uri.parse(endPoint), headers: headers, body: jsonEncode(data))
          .timeout(const Duration(seconds: 20));
      print("rafter request");
      print("response lasan ====> $response");
      print("response ====> ${response.body}");
      final result = jsonDecode(response.body);
      print("request status code ====> ${response.statusCode}");
      if (response.statusCode == 201 || response.statusCode == 200) {
        print("success");
        print("response from base services ===? $result");
        return result;
      } else if (response.statusCode == 422) {
        print("422");
        print("response from base services ===? $result");
        return result;
      } else {
        print("others");
        print("response from base services ===? $result");
        return result;
      }
    } catch (e) {
      return null;
    }
  }

  
  Future postRequestWithoutJsonResponse({required String url, dynamic data}) async {
    print("Inside post request");
    const String url0 = baseUrl;
    var headers = {
      'Content-Type': 'application/json',
      'accept': 'application/json',
    };
    try {
      print("Inside post catxchg");
      final String endPoint = url0 + url;
      print("ENDPOINT ====> $endPoint");
      final response = await http
          .post(Uri.parse(endPoint), headers: headers, body: jsonEncode(data))
          .timeout(const Duration(seconds: 20));
      print("rafter request");
      print("response lasan ====> $response");
      print("response ====> ${response.body}");
      final result = response.body;
      print("request status code ====> ${response.statusCode}");
      if (response.statusCode == 201 || response.statusCode == 200) {
        print("success");
        print("response from base services ===? $result");
        return result;
      } else if (response.statusCode == 422) {
        print("422");
        print("response from base services ===? $result");
        return result;
      } else {
        print("others");
        print("response from base services ===? $result");
        return result;
      }
    } catch (e) {
      return null;
    }
  }

}
