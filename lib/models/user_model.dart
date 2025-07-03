class UserModel {
  final String id;
  final String userName;
  final String email;

  UserModel({required this.id, required this.userName, required this.email});
  factory UserModel.fromJson(json) {
    return UserModel(
      id: json['id'],
      userName: json['userName'],
      email: json['email'],
    );
  }
}
