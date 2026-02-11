class RegisterModel {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? createdAt;
  String? token;

  RegisterModel({this.id, this.name, this.email, this.password, this.token, this.createdAt});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    id: json['user']["id"],
    name: json['user']["name"],
    email: json['user']["email"],
    password: json['user']["password"],
    createdAt: json['user']["created_at"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
  };
}
