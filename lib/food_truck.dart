// Food Truck class generated from inputting JSON string into
// https://javiercbk.github.io/json_to_dart/
class FoodTruck {
  String? id;
  String? name;
  String? imageUrl;
  String? location;
  int? priceLevel;
  String? openTime;
  String? closeTime;

  FoodTruck(
      {this.id,
      this.name,
      this.imageUrl,
      this.location,
      this.priceLevel,
      this.openTime,
      this.closeTime});

  FoodTruck.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    location = json['location'];
    priceLevel = json['priceLevel'];
    openTime = json['openTime'];
    closeTime = json['closeTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['location'] = location;
    data['priceLevel'] = priceLevel;
    data['openTime'] = openTime;
    data['closeTime'] = closeTime;
    return data;
  }
}
