import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/News_provider.dart';
import '../Widgets/news_item.dart';

class CategogyScreen extends StatefulWidget {
  @override
  _CategogyScreenState createState() => _CategogyScreenState();
}

class _CategogyScreenState extends State<CategogyScreen> {
  bool _isLoading = false;
  String screenName = '';

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    super.initState();
  }

  Future<void> dataFetcher(BuildContext context, String name) async {
    await Provider.of<NewsProvider>(context).getAndSetCategoryNews(name);
  }

  @override
  Widget build(BuildContext context) {
    final categoryName = ModalRoute.of(context).settings.arguments as String;
    setState(() {
      screenName = categoryName;
    });
    dataFetcher(context, screenName).then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    final newsData = Provider.of<NewsProvider>(context).categoryNews;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              screenName,
              style: TextStyle(color: Colors.blue),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Container(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
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
                  )
                ],
              ),
      ),
    );
  }
}
