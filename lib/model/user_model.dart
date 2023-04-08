class UserModel {
  // ignore: non_constant_identifier_names
  int user_id;
  UserModel({
    // ignore: non_constant_identifier_names
    required this.user_id,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      user_id: json["user_id"],
    );
  }
}
