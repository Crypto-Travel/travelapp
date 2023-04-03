class FavoriteModel {
  int placeid;

  FavoriteModel({
    required this.placeid,
  });
  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      placeid: json["placeid"],
    );
  }
}
