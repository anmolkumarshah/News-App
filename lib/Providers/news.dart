import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class News with ChangeNotifier {
  String title;
  String author;
  String url;
  String imageUrl;
  DateTime publishedAt;
  String content;

  News({
    @required this.author,
    @required this.content,
    @required this.imageUrl,
    @required this.publishedAt,
    @required this.title,
    @required this.url,
  });
}
