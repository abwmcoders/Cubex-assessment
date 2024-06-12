import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/base/base_view.dart';
import '../../../core/resources/app_button.dart';
import '../../../core/resources/pallet.dart';
import '../../../core/resources/ui_helper.dart';
import '../../../core/resources/universal_fome.dart';
import '../../../core/resources/validators.dart';
import '../login/login.dart';
import 'provider/register_provider.dart';


class QuikRegister extends StatelessWidget {
  QuikRegister({super.key});

  static route(context) => MaterialPageRoute(
        builder: (context) => QuikRegister(),
      );

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false ,
      child: Scaffold(
        body: BaseView<RegisterProvider>(
          vmBuilder: (context) => RegisterProvider(context: context),
          builder: _buildScreen,
        ),
      ),
    );
  }

  Widget _buildScreen(BuildContext context, RegisterProvider registerProvider) {
    return SingleChildScrollView(
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
                const Center(
                  child: Text(
                    "Create new account",
                    style: TextStyle(
                      fontFamily: "MT",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                UIHelper.verticalSpaceLarge,
                UniversalFormField(
                  label: "Username",
                  keyboardType: TextInputType.name,
                  fieldController: registerProvider.username,
                  validator: (String? val) =>
                      FieldValidator().validateUsername(val!),
                ),
                UIHelper.verticalSpaceSmall,
                UniversalFormField(
                  label: "Email",
                  keyboardType: TextInputType.emailAddress,
                  fieldController: registerProvider.email,
                  validator: (String? val) =>
                      FieldValidator().validateEmail(val!),
                ),
                UIHelper.verticalSpaceSmall,
                UniversalFormField(
                  label: "Address",
                  keyboardType: TextInputType.streetAddress,
                  fieldController: registerProvider.address,
                  validator: (String? val) =>
                      FieldValidator().validate(val!),
                ),
                UIHelper.verticalSpaceSmall,
                UniversalFormField(
                  label: "Password",
                  keyboardType: TextInputType.visiblePassword,
                  fieldController: registerProvider.password,
                  obscure: registerProvider.obscureTextGetter,
                  suffixWidget: GestureDetector(
                    onTap: () => registerProvider.obscure(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Text(
                        registerProvider.obscureTextGetter ? 'show' : "hide",
                        style: TextStyle(
                          fontFamily: "MT",
                          fontSize: 15,
                          color: registerProvider.obscureTextGetter ? Palette.primaryColor : Palette.secondaryColor
                        ),
                      ),
                    ),
                  ),
                  validator: (String? val) =>
                      FieldValidator().validatePassword(val!),
                ),
                UIHelper.verticalSpaceSmall,
                UniversalFormField(
                  label: "Confirm Password",
                  keyboardType: TextInputType.visiblePassword,
                  obscure: registerProvider.obscureTextGetter,
                  validator: (String? val) => FieldValidator()
                      .confirmPassword(val!, registerProvider.password.text),
                ),
                UIHelper.verticalSpaceSmall,
                UniversalFormField(
                  label: "Phone Number",
                  keyboardType: TextInputType.number,
                  fieldController: registerProvider.number,
                  validator: (String? val) =>
                      FieldValidator().phoneNumberValidator(val!),
                ),
                UIHelper.verticalSpaceMedium,
                UIHelper.verticalSpaceMedium,
                AppButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      registerProvider.registerUser(ctx: context);
                    }
                  },
                  buttonText: "Register",
                  buttonColor: Palette.primaryColor,
                ),
                UIHelper.verticalSpaceMedium,
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account?",
                      style: const TextStyle(
                          fontSize: 16, color: Palette.secondaryColor),
                      children: [
                        TextSpan(
                          text: ' Login',
                          style: const TextStyle(
                            color: Palette.primaryColor,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                QuikLogin.route(context),
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
    );
  }
}
