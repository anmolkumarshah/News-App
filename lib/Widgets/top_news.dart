import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/News_provider.dart';
import './news_item.dart';

class TopNews extends StatefulWidget {
  @override
  _TopNewsState createState() => _TopNewsState();
}

class _TopNewsState extends State<TopNews> {
  bool _isLoading = false;
  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(Duration.zero).then((_) async {
      await Provider.of<NewsProvider>(context, listen: false).getAndSetNews();
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<NewsProvider>(context).topNews;
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
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
