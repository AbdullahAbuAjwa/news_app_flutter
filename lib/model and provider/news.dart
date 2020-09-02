import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class News {
  var author;
  var title;
  var description;
  var url;
  var urlToImage;
  var publishedAt;
  var newspaperName;

  News({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.newspaperName,
  });
}

class NewsProvider with ChangeNotifier {
  List<News> _items = [];

  List<News> get items {
    return [..._items];
  }

  Future<void> fetchNews(String category) async {

    String url =
        'https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=e74f9b6c149c4b8491aa6b17c370a61a';
    try {
      var response = await get(url);
      var jsonData = jsonDecode(response.body) as Map<Object, dynamic>;
      if (jsonData['status'] == 'ok') {
        final List<News> listNews = [];

        jsonData['articles'].forEach((element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            listNews.add(new News(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              publishedAt: element['publishedAt'],
              newspaperName: element['source']['name'],
            ));
          }
        });
        _items = listNews;
        notifyListeners();
      }
    } catch (error) {
      print('Error: ' + error.toString());
    }
  }
}
