// @19.1 Rest Api Documentation for Blog App
// @19.2 Http packages
// @19.3 dio dependency
// @19.4 Json Parsing
// @19.5 Api Service class
// @19.6 Post List UI
// @19.7 Getx introduction
// @19.8 GetX Architecture
// @19.9 GetX Controller


import 'package:a19_blog_post_api/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}