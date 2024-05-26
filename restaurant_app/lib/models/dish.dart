import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Dish {
  static const apiUrl =
      "https://sebstreb.github.io/binv2110-examen-blanc-api/dishes";

  final int id;
  final String name;
  final double price;
  final String category;
  final String imagePath;

  const Dish({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.imagePath,
  });

  Dish.fromJson(Map<String, dynamic> json)
      : this(
          id: json["id"],
          name: json["name"],
          price: json["price"],
          category: json["category"],
          imagePath: json["imagePath"],
        );

  static Future<List<Dish>> fetchDishes() async {
    var response = await http.get(Uri.parse("$apiUrl/"));

    if (response.statusCode != 200) {
      throw Exception("Error ${response.statusCode} fetching movies");
    }
    return compute((input) {
      final jsonList = jsonDecode(input);
      return jsonList.map<Dish>((jsonObj) => Dish.fromJson(jsonObj)).toList();
    }, response.body);
  }

  @override
  String toString() {
    return 'id: $id, name: $name, price: $price, category: $category, imagePath: $imagePath';
  }
}
