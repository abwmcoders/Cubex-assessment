import 'package:cubex_assessment/src/core/resources/app_button.dart';
import 'package:cubex_assessment/src/core/resources/universal_fome.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/base/base_view.dart';
import '../../../core/resources/functions.dart';
import '../../../core/resources/pallet.dart';
import '../../../core/resources/ui_helper.dart';
import '../../../core/resources/validators.dart';
import '../register/register.dart';
import 'provider/login_provider.dart';


class QuikLogin extends StatelessWidget {
  QuikLogin({super.key});

  static route(context) => MaterialPageRoute(
        builder: (context) => QuikLogin(),
      );
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // form variables
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginProvider>(
      vmBuilder: (context) =>
          LoginProvider(context: context, callInit: true, email: email),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, LoginProvider loginProvider) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome back!",
                      style: TextStyle(
                        fontFamily: "MT",
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    UIHelper.verticalSpaceLarge,
                    UniversalFormField(
                      label: "Username",
                      keyboardType: TextInputType.name,
                      fieldController: loginProvider.email,
                      validator: (String? val) =>
                          FieldValidator().validate(val!),
                    ),
                    UIHelper.verticalSpaceSmall,
                    UniversalFormField(
                      label: "Password",
                      obscure: loginProvider.obscureTextGetter,
                      keyboardType: TextInputType.visiblePassword,
                      fieldController: password,
                      validator: (String? val) =>
                          FieldValidator().validate(val!),
                      suffixWidget: GestureDetector(
                        onTap: () {
                          loginProvider.obscure();
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                          child: Text(
                            loginProvider.obscureTextGetter == true ? 'show' : "hide",
                            style: TextStyle(
                              fontFamily: "MT",
                              fontSize: 15,
                              color: loginProvider.obscureTextGetter == true ? Palette.primaryColor: Palette.secondaryColor
                            ),
                          ),
                        ),
                      ),
                    ),
                    UIHelper.verticalSpaceMedium,
                    AppButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          loginProvider.loginUser(password: password, context: context);
                        }
                      },
                      buttonText: "Login",
                      buttonColor: Palette.primaryColor,
                    ),
                    UIHelper.verticalSpaceMedium,
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account?",
                          style: const TextStyle(
                              fontSize: 16, color: Palette.secondaryColor),
                          children: [
                            TextSpan(
                              text: ' Sign up',
                              style: const TextStyle(
                                color: Palette.primaryColor,
                                fontSize: 16,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    QuikRegister.route(context),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
