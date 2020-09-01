import 'package:flutter/material.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:news_app/Widget/blog.dart';

class CategoriesNewsScreen extends StatefulWidget {
  final String catName;

  CategoriesNewsScreen(this.catName);

  @override
  _CategoriesNewsScreenState createState() => _CategoriesNewsScreenState();
}

class _CategoriesNewsScreenState extends State<CategoriesNewsScreen> {
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScrollAppBar(
        controller: controller,
        title: Text(widget.catName),
      ),
      body: ListView(
        controller: controller,
        children: <Widget>[
          Blog(
            category: widget.catName.toLowerCase(),
          )
        ],
      ),
    );
  }
}
