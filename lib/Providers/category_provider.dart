import 'package:flutter/material.dart';
import './category.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categoryList = [
    Category(
      title: "Business",
      imageUrl:
          "https://images.pexels.com/photos/937481/pexels-photo-937481.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    ),
    Category(
      title: "Sports",
      imageUrl:
          "https://images.pexels.com/photos/364308/pexels-photo-364308.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    ),
    Category(
      title: "Arts",
      imageUrl:
          "https://images.pexels.com/photos/1209843/pexels-photo-1209843.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    ),
    Category(
      title: "Politics",
      imageUrl:
          "https://images.pexels.com/photos/4427547/pexels-photo-4427547.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    ),
    Category(
      title: "Technology",
      imageUrl:
          "https://images.pexels.com/photos/3861969/pexels-photo-3861969.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    ),
    Category(
      title: "Health",
      imageUrl:
          "https://images.pexels.com/photos/4117545/pexels-photo-4117545.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    ),
    Category(
      title: "Students",
      imageUrl:
          "https://images.pexels.com/photos/1438072/pexels-photo-1438072.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    ),
    Category(
      title: "India",
      imageUrl:
          "https://images.pexels.com/photos/1603650/pexels-photo-1603650.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    ),
    Category(
      title: "Maharashtra",
      imageUrl:
          "https://images.pexels.com/photos/2763621/pexels-photo-2763621.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    ),
    Category(
      title: "Market",
      imageUrl:
          "https://images.pexels.com/photos/264507/pexels-photo-264507.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    ),
  ];

  List<Category> get categoryList {
    // print([..._categoryList]);
    return [..._categoryList];
  }
}
