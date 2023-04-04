class UserModel {
  int user_id;
  UserModel({
    required this.user_id,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      user_id: json["user_id"],
    );
  }
}
