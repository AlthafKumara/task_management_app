class UserModel {
  final String id;
  String? name;
  String? email;
  String? createdAt;
  bool? isSynced;

  UserModel({
    required this.id,
    this.name,
    this.email,
    this.createdAt,
    this.isSynced = true,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? createdAt,
    bool? isSynced,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      isSynced: isSynced ?? this.isSynced,
    );
  }
}
