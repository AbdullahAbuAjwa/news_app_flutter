import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Screen/details_screen.dart';
import 'package:news_app/model%20and%20provider/news.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class Blog extends StatefulWidget {
  final String category;

  const Blog({@required this.category});

  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<NewsProvider>(context, listen: false)
          .fetchNews(widget.category),
      builder: (ctx, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  heightFactor: 12,
                  widthFactor: 12,
                  child: CircularProgressIndicator(),
                )
              : Consumer<NewsProvider>(
                  child: Center(
                    child: const Text(
                        'Please make sure you are connected to the Internet!',
                        style: TextStyle(fontSize: 22)),
                  ),
                  builder: (BuildContext context, data, Widget child) =>
                      data.items.length <= 0
                          ? child
                          : ListView.builder(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.items.length,
                              itemBuilder: (ctx, i) => BlogItemCard(
                                description: data.items[i].description,
                                imageUrl: data.items[i].urlToImage,
                                title: data.items[i].title,
                                url: data.items[i].url,
                                name: data.items[i].newspaperName,
                                time: data.items[i].publishedAt,
                              ),
                            ),
                ),
    );
  }
}

class BlogItemCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String url;
  final String name;
  final String time;

  const BlogItemCard({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
    @required this.url,
    @required this.name,
    @required this.time,
  });

  @override
  _BlogItemCardState createState() => _BlogItemCardState();
}

class _BlogItemCardState extends State<BlogItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 200,
              margin: EdgeInsets.only(top: 10),
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    widget.name,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    widget.time,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //       padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                title: Text(
                  widget.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  widget.description,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                 //   alignment: Alignment.topRight,
                    icon: Icon(Icons.open_in_browser, color: Colors.blue),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return DetailsScreen(widget.url);
                      }));
                    },
                  ),
                  IconButton(
                    alignment: Alignment.topRight,
                    icon: Icon(Icons.share, color: Colors.red),
                    onPressed: () {
                      final RenderBox box = context.findRenderObject();
                      Share.share(
                          widget.title + '\n\nSee details: \n' + widget.url,
                          sharePositionOrigin:
                              box.localToGlobal(Offset.zero) & box.size);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}