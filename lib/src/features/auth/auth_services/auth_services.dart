import 'dart:io';

import 'package:cubex_assessment/src/core/resources/constants.dart';
import 'package:flutter/foundation.dart';

import '../../../core/services/services.dart';
import 'user.dart';

class AuthServices extends BaseServices {
  // register user
  Future registerUser(UserObJect user) async {
    var body = {
      "username": user.username,
      "password": user.password,
      "email": user.email,
      "phone": user.number,
      "address": user.address,
      "image": "image.png",
    };
    try {
      print("body: $body");
      final result = postRequestWithoutJsonResponse(url: Constants.register, data: body);
      print("Result register ---> $result");
      return result;
    } on SocketException {
      return null;
    } catch (e) {
      if (kDebugMode) {
        print("$e");
      }
      return e;
    }
  }
}
