class DataModel {
  int id;
  String name;
  String imageUrl;
  String price;
  String stars;
  String description;
  String location;

  DataModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.stars,
    required this.description,
    required this.location,
  });
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      price: json["price"],
      stars: json["stars"],
      location: json["location"],
      imageUrl: json["imageUrl"],
    );
  }
}
