class Constants {
  static const String baseUrl = "https://stacked.com.ng";
  static const String login = "/api/login";
  static const String register = "/api/register";
  static const String profile = "/api/profile";
}

class TextConstants {
  final String emailRegex =
      '[a-zA-Z0-9+._%-+]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+';
  final String invalidEmailField =
      "Email provided isn't valid.Try another email address";
      final String emptyPhoneNumber = "Phone number";
  final String emptyTextField = 'Field cannot be empty!';
  final String emptyPasswordField = 'Password field cannot be empty';
  final String passwordLengthError = 'Password length must be greater than 6';
  final String pinLengthError = 'Password length must be greater than 6';
  final String emptyUsernameField = 'Username  cannot be empty';
  final String usernameLengthError = 'Username length must be greater than 6';
  final String phoneNumberRegex = r'0[789][01]\d{8}';

  final String phoneNumberLengthError = 'Phone number must be 11 digits';

  final String invalidPhoneNumberField =  "Number provided isn't valid.Try another phone number";
}
