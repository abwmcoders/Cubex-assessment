// To parse this JSON data, do
//
//     final loginMod = loginModFromJson(jsonString);

import 'dart:convert';

LoginMod loginModFromJson(String str) => LoginMod.fromJson(json.decode(str));

String loginModToJson(LoginMod data) => json.encode(data.toJson());

class LoginMod {
  bool success;
  String message;
  Data data;

  LoginMod({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginMod.fromJson(Map<String, dynamic> json) => LoginMod(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  User user;
  Session session;

  Data({
    required this.user,
    required this.session,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        session: Session.fromJson(json["session"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "session": session.toJson(),
      };
}

class Session {
  String id;
  int issuedAt;
  int expireIn;
  Session? refreshToken;

  Session({
    required this.id,
    required this.issuedAt,
    required this.expireIn,
    this.refreshToken,
  });

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        id: json["id"],
        issuedAt: json["issued_at"],
        expireIn: json["expire_in"],
        refreshToken: json["refresh_token"] == null
            ? null
            : Session.fromJson(json["refresh_token"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "issued_at": issuedAt,
        "expire_in": expireIn,
        "refresh_token": refreshToken?.toJson(),
      };
}

class User {
  String firstName;
  String lastName;
  DateTime createdAt;
  Email email;
  Phone phone;

  User({
    required this.firstName,
    required this.lastName,
    required this.createdAt,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"],
        lastName: json["last_name"],
        createdAt: DateTime.parse(json["created_at"]),
        email: Email.fromJson(json["email"]),
        phone: Phone.fromJson(json["phone"]),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "created_at": createdAt.toIso8601String(),
        "email": email.toJson(),
        "phone": phone.toJson(),
      };
}

class Email {
  String address;
  bool isActive;

  Email({
    required this.address,
    required this.isActive,
  });

  factory Email.fromJson(Map<String, dynamic> json) => Email(
        address: json["address"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "is_active": isActive,
      };
}

class Phone {
  bool isActive;
  String countryCode;
  String number;
  String formatLs;
  String formatIs;

  Phone({
    required this.isActive,
    required this.countryCode,
    required this.number,
    required this.formatLs,
    required this.formatIs,
  });

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        isActive: json["is_active"],
        countryCode: json["country_code"],
        number: json["number"],
        formatLs: json["format_LS"],
        formatIs: json["format_IS"],
      );

  Map<String, dynamic> toJson() => {
        "is_active": isActive,
        "country_code": countryCode,
        "number": number,
        "format_LS": formatLs,
        "format_IS": formatIs,
      };
}
