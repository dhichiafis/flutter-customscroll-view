import 'package:flutter/material.dart';

class WassapText{
  final String headerText;
  final String bodyText;
  final DateTime created_at;

  const WassapText({
    required this.headerText,
    required this.bodyText,
    required this.created_at
    });


  factory WassapText.fromJson(Map<String,dynamic>json){
    return WassapText(
      headerText: json['headerText']as String, 
      bodyText: json['bodyText'] as String, 
      created_at: DateTime.parse(json['created_at']));
  }
}

class Product{
  final int id;
  final int quantity;
  final String title;
  final String description;
  final int price;
  final String image;


  const Product({
    required this.id,
    required this.quantity,
  required this.title,
  required this.description,
  required this.price,
  required this.image
  
  });

  factory Product.fromJson(Map<String,dynamic>json){
  return Product(
    id:json['id'],
    quantity: json['quantity'],
  title:json['title'],
  description:json['description'],
  price:json['price'],
  image:json['image']
  
  );
  
  }

}