import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  String id;
  String title;
  double price;
  String description;

  Product({
    required this.id,
    required this.description,
    required this.title,
    required this.price,
  });
}
