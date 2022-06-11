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

  factory Tour.get_tour(Map<String, dynamic> object) {
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

  static Future<List<Tour>> getTour(String id) async {
    String api_url = "http://192.168.1.5/api/cities?id=" + id;

    var apiResult = await http.get(Uri.parse(api_url));
    var jsonObject = json.decode(apiResult.body);

    List<dynamic> listTour = (jsonObject as Map<String, dynamic>)['tour'];

    List<Tour> tours = [];

    for (int i = 0; i < listTour.length; i++) {
      tours.add(Tour.get_tour(listTour[i]));
    }
    print(apiResult.body);

    return tours;
  }
}
