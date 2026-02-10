class LoginModel {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  String? token;

  LoginModel({this.id, this.name, this.email, this.password, this.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    id: json["user"]["id"],
    name: json["user"]["name"],
    email: json["user"]["email"],
    password: json["user"]["password"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {"email": email, "password": password};
}
