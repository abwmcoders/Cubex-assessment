import 'constants.dart';
import 'functions.dart';

class FieldValidator {
  String? validateEmail(String value, {String emptyMessage = ""}) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyEmailField(fieldType: emptyMessage);
      }
      // Regex for email validation
      final regExp = RegExp(TextConstants().emailRegex);
      if (regExp.hasMatch(value)) {
        return null;
      }
      return TextConstants().invalidEmailField;
    } else {
      return null;
    }
  }

  String? phoneNumberValidator(String value, {String emptyMessage = ""}) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyEmailField(fieldType: "Phone number");
      }
      if (value[0].contains("0")) {
        final regExp = RegExp(TextConstants().phoneNumberRegex);
        print(regExp.hasMatch(value));
        if (regExp.hasMatch(value)) {
          return null;
        }
        if (value[0].contains("0") && value.length == 11) {
          return null;
        }
        return TextConstants().invalidPhoneNumberField;
      }
      // Regex for email validation
      final regExp = RegExp(TextConstants().emailRegex);
      if (regExp.hasMatch(value)) {
        return null;
      }
      return TextConstants().invalidEmailField;
    } else {
      return null;
    }
  }

  String? validatePhoneNumber(String value) {
    String val = value.replaceAll(RegExp(r"\s+"), "");

    print(val);
    if (val != null) {
      if (val.isEmpty) {
        return TextConstants().emptyTextField;
      }
      // Regex for phone number validation
      // final regExp = RegExp(phoneNumberRegex);
      // print(regExp.hasMatch(value));
      // if (regExp.hasMatch(value)) {
      //   return null;
      // }
      if (val[0].contains("0") && val.length == 11) {
        return null;
      }
      if (val[0].contains("0") || val.length > 11 || val.length < 11) {
        return TextConstants().invalidPhoneNumberField;
      }
      return TextConstants().invalidPhoneNumberField;
    } else {
      return null;
    }
  }

  static const String resetText = "kindly input different password";
  static const String mismatchText = "Password doesn't match";

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return TextConstants().emptyPasswordField;
    }

    if (value.length < 6) {
      return TextConstants().passwordLengthError;
    }
      return null;
  }

  String? confirmPassword(String oldPassword, String newPassword) {
    if (newPassword.isEmpty) {
      return TextConstants().emptyPasswordField;
    }

    if (newPassword.length < 6) {
      return TextConstants().passwordLengthError;
    }
    if (newPassword == oldPassword) {
      return null;
    }
  
    return mismatchText;
  }

  String? validateUsername(String value) {
    if (value.isEmpty) {
      return TextConstants().emptyUsernameField;
    }

    if (value.length < 3) {
      return TextConstants().usernameLengthError;
    }
  
    return null;
  }

  String? validate(String value, {String? validatorText}) {
    if (value.isEmpty) {
      return validatorText ?? TextConstants().emptyTextField;
    }
  
    return null;
  }
}
