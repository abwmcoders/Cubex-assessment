import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../core/animations/animation.dart';
import '../../core/cache/storage.dart';
import '../../core/cache/store_credentials.dart';
import '../../core/resources/functions.dart';
import '../auth/login/login.dart';
import '../auth/register/register.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _storageServices = getIt<StorageCredentials>();
  bool splashStatusBool = false;

  Future<dynamic> _naviagetToLogin() {
    Future<dynamic> navigateAfterFuture =
        Future.delayed(const Duration(milliseconds: 4000), () {
      NavigateClass().pushRemoveScreen(
        context: context,
        screen: QuikLogin(),
      );
    });
    Storage().putString("session", "used");
    return navigateAfterFuture;
  }

  Future<dynamic> _navigateToOnSignUp() {
    Future<dynamic> navigateAfterFuture =
        Future.delayed(const Duration(seconds: 3), () {
      NavigateClass().pushRemoveScreen(
        context: context,
        screen: QuikRegister(),
      );
    });
    Storage().putString("session", "used");
    return navigateAfterFuture;
  }

  void runInit() async {
    splashStatusBool = await _storageServices.newUserStatus;
    if (splashStatusBool == true) {
      _naviagetToLogin();
    } else {
    _navigateToOnSignUp();
    }
  }

  @override
  void initState() {
    super.initState();
    runInit();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ScaleOut(animationChild: [
            Hero(
              tag: "logo",
              child: Center(
                child: Text(
                  "The Made\nBerry",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
