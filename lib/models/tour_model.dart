import 'dart:convert';

import 'package:http/http.dart' as http;

class Tour {
  String id;
  String title;
  String description;
  String travel_route;
  String itinary;
  String price;
  String price_detail;
  String image;
  String id_kota;

  Tour({
    required this.id,
    required this.title,
    required this.description,
    required this.travel_route,
    required this.itinary,
    required this.price,
    required this.price_detail,
    required this.image,
    required this.id_kota,
  });

  factory Tour.fromJson(Map<String, dynamic> object) {
    return Tour(
        id: object['id'].toString(),
        title: object['title'].toString(),
        description: object['description'].toString(),
        travel_route: object['travel_route'].toString(),
        itinary: object['itinary'].toString(),
        price: object['price'].toString(),
        price_detail: object['price_detail'].toString(),
        image: object['image'].toString(),
        id_kota: object['id_kota'].toString());
  }
}
