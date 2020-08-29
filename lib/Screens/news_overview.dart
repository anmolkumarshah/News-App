import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/categories.dart';
import '../Widgets/top_news.dart';
import '../Providers/News_provider.dart';

class NewsOverview extends StatelessWidget {
  Future<void> refreshNews(BuildContext context) async {
    await Provider.of<NewsProvider>(context, listen: false).getAndSetNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Anmol",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            Text(
              "Vidya",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => refreshNews(context),
        child: Container(
          child: Column(
            children: [
              Categories(),
              Expanded(
                child: TopNews(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
