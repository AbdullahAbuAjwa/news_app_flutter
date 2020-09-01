import 'package:flutter/material.dart';
import 'package:news_app/Widget/blog.dart';
import 'package:news_app/Widget/category_card.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();

//  Future<Null> getRefresh() async {
//    await Future.delayed(
//      Duration(seconds: 5),
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScrollAppBar(
        controller: controller,
        title: Text('News app'),
      ),
      body: Snap(
        controller: controller.appBar,
        child: ListView(
          controller: controller,
          children: <Widget>[
            CategoryCard(),
//            Blog(
//              category: 'general',
//            )
          ],
        ),
      ),
    );
  }
}
