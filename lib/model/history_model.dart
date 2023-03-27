class HistoryModel {
  int userid;
  int placeid;
  String resultdate;
  String placename;
  String imageUrl;
  String price;
  String stars;
  String description;
  String location;

  HistoryModel({
    required this.userid,
    required this.placeid,
    required this.resultdate,
    required this.placename,
    required this.imageUrl,
    required this.price,
    required this.stars,
    required this.description,
    required this.location,
  });
  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      userid: json["userid"],
      placeid: json["placeid"],
      resultdate: json["resultdate"],
      placename: json["placename"],
      description: json["description"],
      price: json["price"],
      stars: json["stars"],
      location: json["location"],
      imageUrl: json["imageUrl"],
    );
  }
}
