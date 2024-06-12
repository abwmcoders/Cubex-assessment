// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:cubex_assessment/src/features/auth/auth_services/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/base_viewmodel.dart';
import '../../../../core/resources/functions.dart';
import '../../../profile/profile.dart';
import '../../auth_services/auth_services.dart';
import '../../login/login.dart';

class RegisterProvider extends BaseViewModel {
  BuildContext? context;
  RegisterProvider({this.context});

  //! form variables
  TextEditingController username = TextEditingController(text: "");
  TextEditingController address = TextEditingController(text: "");
  TextEditingController email = TextEditingController(text: "");
  TextEditingController number = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");

  //! change textfield value to mek object value
  void setState({String? textFieldVal, required String value}) {
    textFieldVal = value;
    notifyListeners();
    if (kDebugMode) {
      print(textFieldVal);
    }
  }

  void registerUser({required BuildContext ctx}) async {
    dismissKeyboard(ctx);
    changeLoaderStatus(true);
    UserObJect user = UserObJect(
      username: username.text.trim(),
      address: address.text.trim(),
      password: password.text.trim(),
      email: email.text.trim(),
      number: number.text.trim(),
    );
    var request = await AuthServices().registerUser(user);
    changeLoaderStatus(false);
    if (kDebugMode) {
      print("request below");
      print(request.toString());
    }
    try {
      if (request != null) {
        changeLoaderStatus(false);
           NavigateClass().pushRemoveScreen(
          context: ctx,
          screen: QuikLogin(),
        );
        email.clear();
        username.clear();
        address.clear();
        number.clear();
        password.clear();
      } else {
        NotifyUser().showMessage(
          context!,
          message: request.toString(),
        );
      }
    } catch (e) {
      // show error snackbar or notify user of the error
      if (kDebugMode) {
        print(e.toString());
        NotifyUser().showMessage(
          context!,
          message: e.toString(),
        );
      }
    }
  }

  @override
  FutureOr<void> disposeState() {}

  @override
  FutureOr<void> initState() {}
}
