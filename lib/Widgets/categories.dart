import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/category_provider.dart';
import './category_item.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<CategoryProvider>(context);
    final list = categoryData.categoryList;
    return Container(
      margin: EdgeInsets.all(5),
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) => CategoryItem(
          title: list[index].title,
          imageUrl: list[index].imageUrl,
        ),
        itemCount: list.length,
      ),
    );
  }
}
