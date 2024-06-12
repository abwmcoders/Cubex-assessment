// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:cubex_assessment/src/features/profile/profile.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/base_viewmodel.dart';
import '../../../../core/cache/storage.dart';
import '../../../../core/resources/functions.dart';
import '../repository/login_repo.dart';

class LoginProvider extends BaseViewModel {
  BuildContext? context;
  bool callInit;
  final TextEditingController? email;

  LoginProvider({
    this.context,
    this.callInit = false,
    this.email,
  });

  void loginUser({required BuildContext context ,required TextEditingController password}) async {
    dismissKeyboard(context);
    changeLoaderStatus(true);
    print(email!.text.toString());
    
    var request = await LoginRepository().loginUser(
      email: email!.text.toString(),
      password: password.text.toString(),
    );
    print("request login : $request");
    changeLoaderStatus(false);
    try {
      if (request != null) {
        Storage().putString('token', request['token']);
          NavigateClass().pushRemoveScreen(
            context: context,
            screen: const ProfileScreen(),
          );
          email!.clear();
          password.clear();
        }
      else {
        print("error in provider");
        NotifyUser().showMessage(
          context,
          message: "Error logging in User",
        );
        // show whats wrong
      }
    } catch (e) {
      // show error message
      print("error in provider login ====> $e");
      NotifyUser().showMessage(
        context,
        message: e.toString(),
      );
  
    }
  }

  @override
  FutureOr<void> disposeState() {}

  @override
  FutureOr<void> initState() {}
}
