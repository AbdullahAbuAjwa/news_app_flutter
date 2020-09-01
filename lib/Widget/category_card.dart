import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Screen/categories_news_screen.dart';
import 'package:news_app/model%20and%20provider/category.dart';

class CategoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = list_categories
        .map((catData) => CategoryItemCard(
              catName: catData.categoryName,
              imageUrl: catData.imageUrl,
            ))
        .toList();
    return Container(
      height: 600,
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: list_categories.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryItemCard(
            catName: c[index].catName,
            imageUrl: c[index].imageUrl,
          );
        },
      ),
    );
  }
}

class CategoryItemCard extends StatelessWidget {
  final String catName;
  final String imageUrl;

  const CategoryItemCard({this.catName, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return CategoriesNewsScreen(catName);
        }));
      },
      child: Container(
        //  height: 120,
        margin: EdgeInsets.only(top: 8, left: 4, right: 4),
        child: Card(
          color: Color(0xFFECEFF1),
          elevation: 5,
          child: Column(children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                margin: EdgeInsets.only(top: 12),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 160,
                  height: 130,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              catName,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ]),
        ),
      ),
    );
  }
}
