import 'dart:io';

import 'package:cubex_assessment/src/core/resources/constants.dart';

import '../../../../../locator.dart';
import '../../../../core/services/services.dart';


class LoginRepository {
  final baseServices = getIt<BaseServices>();

  Future loginUser({String? email, String? password}) async {
    String loginUrl = Constants.login;
    var body = {
      "username": email,
      "password": password,
    };
    try {
      var response = baseServices.postRequest(url: loginUrl, data: body);
      print("login repo");
      print("response from login repo ===? $response");
      return response;
    } on SocketException {
      return "Socket exception occurred";
    } catch (e) {
      print("from login repo catch");
      print(e.toString());
      return e;
    }
  }
}
