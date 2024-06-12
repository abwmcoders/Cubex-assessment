class RegisterMod {
  String username;
  String password;
  String email;
  String phone;
  String address;
  String image;

  RegisterMod({
    required this.username,
    required this.password,
    required this.email,
    required this.phone,
    required this.address,
    required this.image,
  });

  factory RegisterMod.fromJson(Map<String, dynamic> json) => RegisterMod(
        username: json["username"],
        password: json["password"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
        "phone": phone,
        "address": address,
        "image": image,
      };
}
