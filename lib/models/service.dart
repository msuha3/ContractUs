import 'package:flutter/material.dart';

class Service {
  String title;
  String rating;
  String ratingcount;
  String price;
  String name;
  String level;
  String image;
  bool favorite;

  Service({
    required this.rating,
    required this.level,
    required this.image,
    required this.title,
    required this.price,
    required this.favorite,
    required this.name,
    required this.ratingcount,
  });

}