import 'dart:core';

class Order {
  int id;
  String tour_date;
  int status;
  String booking_code;
  String quantity;
  String name;
  String phone_number;
  String email;
  String address;
  int tour_id;
  DateTime created_at;
  String title;
  String price;

  Order({
    required this.id,
    required this.tour_date,
    required this.status,
    required this.booking_code,
    required this.quantity,
    required this.name,
    required this.phone_number,
    required this.email,
    required this.address,
    required this.tour_id,
    required this.created_at,
    required this.title,
    required this.price
});

  factory Order.fromJson(Map<String,dynamic> json){
    return Order(
        id : json['id'],
        tour_date : json['tour_date'],
        status : json['status'],
        booking_code: json['booking_code'],
        quantity : json['quantity'],
        name : json['name'],
        phone_number : json['phone_number'],
        email : json['email'],
        address : json['address'],
        tour_id : json['tour_id'],
        created_at : DateTime.parse(json['created_at']),
        title : json['tour']['title'],
        price : json['tour']['price']
    );
  }
}