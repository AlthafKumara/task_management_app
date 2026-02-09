class RegisterModel {
  final String? name;
  final String? email;
  final String? password;
  String? token;

  RegisterModel({this.name, this.email, this.password, this.token});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
  };
}
