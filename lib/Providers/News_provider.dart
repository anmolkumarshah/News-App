import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsProvider with ChangeNotifier {
  List<News> _topNews = [];
  List<News> _categoryNews = [];

  List<News> get topNews {
    return [..._topNews];
  }

  List<News> get categoryNews {
    return [..._categoryNews];
  }

  Future<void> getAndSetCategoryNews(String screenName) async {
    // print(screenName);
    final url =
        "https://newsapi.org/v2/everything?q=$screenName&apiKey=1a1de695f5e04c7f81397ed3cdac3cac";
    try {
      final response = await http.get(url);
      List<News> newsItemCategory = [];
      json.decode(response.body)['articles'].forEach((news) {
        if (news['author'] != null &&
            news['content'] != null &&
            news['urlToImage'] != null &&
            news['title'] != null &&
            news['publishedAt'] != null &&
            news['url'] != null) {
          var item = News(
            author: news['author'],
            content: news['content'],
            imageUrl: news['urlToImage'],
            publishedAt: DateTime.parse(news['publishedAt']),
            // publishedAt: DateTime.now(),
            title: news['title'],
            url: news['url'],
          );
          newsItemCategory.add(item);
        }
        _categoryNews = newsItemCategory;
      });
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> getAndSetNews() async {
    const url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=1a1de695f5e04c7f81397ed3cdac3cac";
    try {
      final response = await http.get(url);
      List<News> newsItem = [];
      json.decode(response.body)['articles'].forEach((news) {
        if (news['author'] != null &&
            news['content'] != null &&
            news['urlToImage'] != null &&
            news['title'] != null &&
            news['publishedAt'] != null &&
            news['url'] != null) {
          var item = News(
            author: news['author'],
            content: news['content'],
            imageUrl: news['urlToImage'],
            publishedAt: DateTime.parse(news['publishedAt']),
            // publishedAt: DateTime.now(),
            title: news['title'],
            url: news['url'],
          );
          newsItem.add(item);
        }
        _topNews = newsItem;
      });
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
