import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screen/home_screen.dart';
import 'model and provider/news.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: NewsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter',
        theme: ThemeData(
            primarySwatch: Colors.green, accentColor: Colors.greenAccent),
        home: HomeScreen(),
      ),
    );
  }
}
