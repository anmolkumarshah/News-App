import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsItem extends StatelessWidget {
  final String title;
  final String author;
  final String url;
  final String imageUrl;
  final DateTime publishedAt;
  final String content;

  NewsItem({
    this.author,
    this.content,
    this.imageUrl,
    this.publishedAt,
    this.title,
    this.url,
  });

  void goToWebView(BuildContext context, String url) {
    Navigator.of(context).pushNamed("/web-screen", arguments: url);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white12,
      borderRadius: BorderRadius.circular(10),
      onTap: () => goToWebView(context, url),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(3),
        child: Card(
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                  Container(
                    padding: EdgeInsets.all(7),
                    alignment: Alignment.bottomLeft,
                    height: 300,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "By ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Text(
                      "$author",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              Text(
                "Published : ${DateFormat.yMMMMEEEEd().format(publishedAt)}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Container(
                child: Text(
                  content,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
                padding:
                    EdgeInsets.only(top: 20, right: 10, left: 10, bottom: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
