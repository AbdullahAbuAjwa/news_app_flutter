import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:news_app/Widget/blog.dart';
import 'package:news_app/Widget/category_card.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News app'),
      ),
      body: ListView(
        children: <Widget>[
          //SizedBox(height: 12),
          CategoryCard(),
        ],
      ),
    );
  }
}
