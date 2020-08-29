import 'package:flutter/material.dart';

class Category with ChangeNotifier {
  final String title;
  final String imageUrl;

  Category({this.title, this.imageUrl});
}
