import 'dart:convert';
import 'dart:developer';

import 'package:flutter_application_1/food_truck.dart';
import 'package:http/http.dart';

Future<List<FoodTruck>> foodTruckList() async {
  String baseUrl = "api.foodtruck.schedgo.com";
  String endpoint = "food-trucks";
  Map<String, dynamic>? parameters;

  var uri = Uri.http(baseUrl, endpoint, parameters);

  Response response = await get(uri); // Wait for API response
  List<dynamic> list =
      jsonDecode(response.body); // Decode JSON string into JSON map
  List<FoodTruck> foodTrucks = list
      .map((e) => FoodTruck.fromJson(e))
      .toList(); // Iterate and turn each json map into a Food Truck
  log(response.body); // Log to console for debugging
  return foodTrucks;
}
