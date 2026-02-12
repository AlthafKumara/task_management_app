class UpdateProfileModel {
  final String? name;
  final String? email;

  UpdateProfileModel({this.name, this.email});

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
  };
}