import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/News_provider.dart';
import './news_item.dart';

class CategoryTopNews extends StatefulWidget {
  @override
  _CategoryTopNewsState createState() => _CategoryTopNewsState();
}

class _CategoryTopNewsState extends State<CategoryTopNews> {
  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<NewsProvider>(context).categoryNews;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (ctx, index) => NewsItem(
              author: newsData[index].author,
              content: newsData[index].content,
              imageUrl: newsData[index].imageUrl,
              publishedAt: newsData[index].publishedAt,
              title: newsData[index].title,
              url: newsData[index].url,
            ),
            itemCount: newsData.length,
          ),
        ),
      ],
    );
  }
}
