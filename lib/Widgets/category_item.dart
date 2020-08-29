import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final title;
  final imageUrl;

  CategoryItem({this.imageUrl, this.title});

  void moveToCategory(BuildContext context, String name) {
    Navigator.of(context).pushNamed("/category-screen", arguments: name);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.orange,
      onTap: () => moveToCategory(context, title),
      child: Container(
        width: 150,
        padding: EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: 200,
                width: 200,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black45),
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
